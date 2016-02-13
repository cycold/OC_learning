//
//  main.m
//  多对象内存管理
//
//  Created by icewater on 2/11/16.
//
//

/**
 当成员变量指向某些对象时,一定要在set, dealloc方法中进行内存管理
 这也就是set方法的内存管理
 */



#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "House.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Gamer *g = [[Gamer alloc] init]; // 1
        
        House *h = [[House alloc] init]; // 1
        h.num = 10; // 这里的num为私有属性,通过setter方法访问
        
        g.house = h;
        
        [h release]; // 0
        [g release]; 
        
    }
    return 0;
}
