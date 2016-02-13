//
//  main.m
//  深拷贝
//
//  Created by icewater on 2/13/16.
//
//

/**
 Array/Dictionarys深拷贝
// flag设置为YES,触发数组,字典的深拷贝
 // 使用系统协议
 - (id)initWithArray: (NSArray *)arry copyitems: (BOOL)flag;  

 - (id)initWithDictionary: (NSDictionary *)dict copyItems: (BOOL)flag;
 
 
 // 使用归档进行深拷贝
 NSMyutableArray *_carlist = [[NSMutable alloc] init];
 // ...
 
 // 保存Array所有内容
 NSData *buffer = [NSKeyedArchiver archivedDataWithRootObject:_carlist];
 // 恢复所有内容
 NSMutableArray *arr3 = [NSkeyedUnarchiver unarchivedObjectWithData:buffer];
 */

#import <Foundation/Foundation.h>
#import "QFCar.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        NSMutableArray *_carlist = [[NSMutableArray alloc] init];
        // 放入10个对象到数组中
        for (int i = 0; i < 10; i++) {
            QFCar *c = [[QFCar alloc] init];
            c.name = [NSString stringWithFormat:@"car-%d", i];
            c.year = 2000 + i;
            [_carlist addObject:c];
        }
        
        // 注意这两个方法的区别
        NSMutableArray *arr2 = [[NSMutableArray alloc] initWithArray:_carlist]; // 浅拷贝
    
        // 改变_carlist中的值, 也就是改变了arr2中的值
        // [[_carlist objectAtIndex:0] setName:@"new car"];
        [_carlist[0] setName:@"new car"];
        NSLog(@"arr2: %@", arr2);
        
        // 这里如果直接使用深拷贝copyItems:YES 那么此时程序会crash,因为它不知道如何拷贝. 里面没有实现NSCopying协议
        //NSMutableArray *arr3 = [[NSMutableArray alloc] initWithArray:_carlist copyItems:YES]; // 深拷贝
        
        // 当实现协议后,copyItems:YES就会触发实现的协议
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithArray:_carlist copyItems:YES]; // 深拷贝
        
        // 改变原来数组,看是否影响拷贝后数组?
        [_carlist[2] setName:@"2222"];
        // 没有受到影响
        NSLog(@"arr3: %@", arr3);
        
        
        // 下面使用归档来实现深拷贝 把数组_carlist转成二进制对象
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_carlist];
        // 这里崩溃的原因是,QFCar没有实现归档协议, archieve, 即 NSCoding协议
        
        // 把二进制对象还原成原来数组
        NSMutableArray *arr4 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        
        // 改变原来数组,看是否影响拷贝后数组?
        [_carlist[5] setName:@"5555"];
        // 没有受到影响
        NSLog(@"arr4 is %@", arr4);
        
    }
    return 0;
}
