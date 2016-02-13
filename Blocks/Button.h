//
//  Button.h
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>
@class Button;

// 定义一个block
typedef void (^ButtonBlock) (Button *btn);

@interface Button : NSObject

@property (nonatomic, assign) ButtonBlock block;

// 模拟按钮点击
- (void) click;

@end
