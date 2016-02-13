//
//  ButtonListener.h
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

//#import "Button.h"

// 对协议进行提前声明,和@class作用一样
@protocol ButtonDelegate;

// 类实现一个协议,使用<>
// 需要实现协议中的方法
@interface ButtonListener : NSObject <ButtonDelegate>

@end
