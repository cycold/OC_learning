//
//  main.m
//  Blocks
//
//  Created by icewater on 2/11/16.
//
//

/**
 Block:
   封装了一段代码, 可以在任何时候执行
 
 ^ 表示block
 
 int (^sum) (int, int) = ^(int a, int b) {
    return a + b;
 };
 */


#import <Foundation/Foundation.h>
#import "Button.h"

// block还可以用typedef定义

typedef int (^MySum) (int, int);

void test(){
    int (^sum) (int, int) = ^(int a, int b) {
        return a + b;
    };
    
    int res = sum(2,4);
    NSLog(@"%d", res);
}

void test2() {
    
    __block int c = 23;
    
    // 如果使用两个下划线__block声明就能在block中修改
    
    // 可以直接声明一个block变量
    MySum sum;
    // 实现这个block
    sum = ^(int a, int b) {
        // block可以访问外部的局部变量, 默认情况下不能修改
        NSLog(@"c is %d", c);
        // 修改c
        c = 19;
        NSLog(@"c is %d", c);
        return a + b;
    };
    
    NSLog(@"%d", sum(10,12));
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test2();
        
        Button *btn = [[Button alloc] init];
        
        btn.block = ^(Button *btn) {
            NSLog(@"%@按钮被点击...", btn);
        }; // 回调
        
        // 模拟按钮点击
        [btn click];
    }
    return 0;
}
