//
//  ThemeManager.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "ThemeManager.h"

// 定义全局变量用来保存单例, 这里也可以使用id类型
static ThemeManager *s;

@implementation ThemeManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"Default"];
    }
    return self;
}

#if 0

+ (id)sharedThemeManager {
    if (s == nil) {
        s = [[[self class] alloc] init];
    }
    return s;
}


// 加锁的写法,防止多个线程同时访问一段代码,创建多个对象
+ (id)sharedThemeManager {
    @synchronized(self) { // @synchronized让这段代码处于atomic状态
        // 如果有多个线程进入这段代码,那么只能是有一个线程执行
        if (s == nil) {
            s = [[[self class] alloc] init];
        }
    }
    return s;
}

#endif

// GCD block写法
+ (id)sharedThemeManager {
    
    static dispatch_once_t onceToken;
    // dispatch_once 保证block只能执行一次, 所以这里就不会有线程的问题,
    // 即使多个线程进来,这里也只能被执行一次
    dispatch_once(&onceToken, ^{
        if (s == nil) {
            s = [[[self class] alloc] init];
        }
    });
    
    return s;
}



@end
