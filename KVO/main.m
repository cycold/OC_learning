//
//  main.m
//  KVO
//
//  Created by icewater on 2/13/16.
//
//

/**
 Key Value Observer
 kvo: 多个对象之间的通讯
      某个对象感知其他对象的变化
 
 // 1. 注册监听对象
 - (void)addObserver: (NSObject *)observer // 谁来监听这个对象
          forKeyPath: (NSString *)keyPath  // 监听对象中的某个属性(子属性使用.)
  ....
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 人对象监听银行账户对象
        Person *p = [[Person alloc] init];
        [p registerAsObserver];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
