//
//  main.m
//  Protocol
//
//  Created by icewater on 2/11/16.
//
//


/**
 protocol: 
    简单来说就是一系列方法的列表,其中声明的方法可以被任何类实现.这种模式一般称为代理(delegation)模式
    在iOS和OS X开发中,Apple采用了大量的代理模式来实现MVC中的View(UI控件)和Controller(控制器)的解耦
 */


#import <Foundation/Foundation.h>
#import "Button.h"
#import "ButtonListener.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //初始化一个按钮
        Button *btn = [Button new];
        //初始化一个按钮的监听器
        ButtonListener *listener = [ButtonListener new];
        //设置按钮的监听器(OC中叫做代理)
        btn.delegate = listener;
        //点击按钮
        [btn click];
    }
    return 0;
}
