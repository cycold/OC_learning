//
//  main.m
//  单例
//
//  Created by icewater on 2/13/16.
//
//


/**
 
 单例: 数据共享, 相当于c语言中全局变量. 在内存中只有一个对象
 
 一个典型的单例写法:
 
 static id sharedMyManager;
 + (id)sharedMyManager {
    if (sharedMyManager == nil) {
        sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
 }
 
 */

#import <Foundation/Foundation.h>
#import "ThemeManager.h"


// 单例的各种写法:

#if 0
 
 // 加锁的写法,防止多个线程同时访问一段代码,创建多个对象
 
 (id)sharedThemeManager {
     @synchronized(self) {
     
         if (s == nil) {
            s = [[[self class] alloc] init];
         }
      }
     
      return s;
 }
 
 
 // 第一次实例化创建Lock free, 避免多个线程同时进入
 + (voidq) initialize {
    static BOOL initialized = NO;
    if (initialized == NO) {
        initialized = YES;
        s = [[[self class] alloc] init];
    }
 }

 // GCD block写法
 + (id)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
 }
 
 
#endif


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 注意使用单例,是调用类方法,不是使用对象初始化方法
        ThemeManager *th = [ThemeManager sharedThemeManager];
        ThemeManager *th2 = [ThemeManager sharedThemeManager];
        
        // 单例不能使用这种直接new对象方法
        ThemeManager *th3 = [[ThemeManager alloc] init];
        
        NSLog(@"th: %p, th2: %p, th3: %p", th, th2, th3);
        
        th2.name = @"new name";
        
        NSLog(@"th.name %@", th.name);
        NSLog(@"th2.name %@", th2.name);
        NSLog(@"th3.name %@", th3.name);
        
        
    }
    return 0;
}
