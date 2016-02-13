//
//  Listener.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "Listener.h"

@implementation Listener


- (void)wantToListen {
    // 1. 要注册
    //  @"BJBroadcast"要和发送对应
    // 第1,2个参数是只要有这个广播(BJBroadcast,第三个参数),就调用[self recvBcast:]
    // 第四个参数设置为nil, 表示不需要选择广播站
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recvBcast:)
                                                 name:@"BJBroadcast"
                                               object:nil];
    
    // 2. 接收广播数据
}

- (void)recvBcast: (NSNotification *)notfiy {
    // notify就是具体的广播消息
    NSString *name = notfiy.name;
    NSLog(@"notfif is %@", notfiy);
}

@end
