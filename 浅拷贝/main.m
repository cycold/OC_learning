//
//  main.m
//  浅拷贝
//
//  Created by icewater on 2/13/16.
//
//

/**
 
 任何实现拷贝功能需要实现NSCopying协议
 比如拷贝对象,那么对象必须实现这个协议
 
 @protocol NSCopying
 
 - (id)copyWithZone: (NSZone *)zone;
 
 @end
 
 // 或者需要拷贝可变
 @protocol NSMutableCopying
 
 - (id)mutableCopyWithZone: (NSZone *)zone;
 
 @end
 
 比如需要将NSString 只读字符串拷贝成NSMutableString, 就需要使用mutableCopy方法;
 或者是NSMutableString拷贝成NSString,使用copy方法
 
 开发中使用copy方法较多
 
 @property (nonatomic, copy) NSString *name;
 
 展开: 
 - (void)setName: (NSString *)name {
 
    if (_name != name ) {
        [_name release];
        _name = [name copy];
    }
 
 }
 */

#import <Foundation/Foundation.h>
#import "QFCar.h"

// 系统的copy和mutableCopy方法使用
void copyUsing() {
    
    NSString *s = [NSString stringWithFormat:@"hello world!!"];
    NSString *ss = [s copy];
    
    NSLog(@"s: %p", s);
    NSLog(@"ss: %p", ss);
    NSLog(@"%@", ss);
    
    // 将s拷贝成一个可变字符串
    NSMutableString *ms = [s mutableCopy];
    [ms appendString:@"!!!"];
    
    NSLog(@"s: %p", s);
    NSLog(@"ms: %p", ms);
    NSLog(@"%@", ms);
    
    // 把可变字符串拷贝成不可变字符串
    NSMutableString *mss = [NSMutableString stringWithFormat:@"mubtable string"];
    NSMutableArray *ns = [mss copy];
    // [ns appenString:@"new"]; // 报错,说明是不可变字符串
    NSLog(@"ns: %@", ns);
    
    /*
     
     结论: copy会将字符串拷贝成不可变的字符串,mutableCopy会将字符串拷贝成可变的字符串
     主要用在: NSString, NSArray, NSDictionary, NSData中
     */
    
    // 自己设计一个类实现NSCopying协议
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // copyUsing();
        
        QFCar *car = [[QFCar alloc] init];
        car.name = @"bmw";
        car.year = 1990;
        
        NSLog(@"car: %@, %d", car.name, car.year);
        
        QFCar *car2 = [car copy];
        car2.name = @"ben";
        car2.year = 2011;
        // 这里程序会崩溃,原因是没有实现NSCopying协议,对象不知道怎么copy
        
        NSLog(@"car2: %@, %d", car2.name, car2.year);
        
        // 对象的mutableCopy一般不常用,使用copy既可以了
        QFCar *car3 = [car mutableCopy];
        NSLog(@"%@, %d", car3.name, car3.year);
    }
    return 0;
}
