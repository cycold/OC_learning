//
//  main.m
//  NSArray
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 OC中的数组,通过一个数组类NSArray创建.
 其分为两类: NSArray(不可变数组), NSMutableArray(可变数组)
 数组的元素都是对象,可以是任意的对象.(注意,不能是int,char...,NS数组元素只能是对象)
 数组中的元素都是对象的地址
 */

// 创建数组
void createArray(){
    
    NSArray *arr = [[NSArray alloc] initWithObjects: @"abc", @"hello", @"good", nil];
    
    // 使用NSLog答应数组,其实是打印数组对象中的description方法的返回值,数组中的description方法其实是调用的是每一个元素中的description方法
    // 一般使用格式符%@,打印对象,其实都是打印对象的description方法
    NSLog(@"%@", arr);
}

// 数组遍历方法
void enumArray(NSArray *arr){
    // 1. 枚举器法
    // 创建一个枚举器,根据数组的每个元素
    NSEnumerator *enumerator = [arr objectEnumerator];
    id obj;
    while (obj = [enumerator nextObject]) {
        NSLog(@"%@", obj);
    }
    
    // 2. 快速枚举法
    for (id obj in arr) {
        NSLog(@"%@", obj);
    }
    
    // 3. 使用i值遍历
    // 获取数组的长度
    NSUInteger length = [arr count];
    // 获取数组某个索引值元素(对象地址)
    obj = [arr objectAtIndex:2];
    
    for (NSUInteger i = 0; i < length; i++) {
        NSLog(@"%@", [arr objectAtIndex:i]);
    }
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // createArray();
        
        NSArray *arr = [[NSArray alloc] initWithObjects:@"abc", @"hello", @"good", nil];
        
        enumArray(arr);
        
    }
    return 0;
}
