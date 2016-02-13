//
//  Button.h
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

// 定义一个协议, 实现基本协议 NSObject
// : 表示继承, ()表示分类 <>表示协议
// 一系列方法
@protocol ButtonDelegate <NSObject>

- (void)onClick;

@end

@interface Button : NSObject

// 持有协议的引用
// delegate就是按钮的监听器 id后面的<>表示一定要遵循的协议名
@property (nonatomic, strong) id<ButtonDelegate> delegate;

//模拟点击按钮
- (void) click;

@end

