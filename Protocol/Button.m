//
//  Button.m
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import "Button.h"

@implementation Button

- (void) click {
    
    NSLog(@"按钮被点击");
    // 通知监听器
    [_delegate onClick];
    
}

@end
