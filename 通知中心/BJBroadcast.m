//
//  BJBroadcast.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "BJBroadcast.h"

@implementation BJBroadcast


// 设置一个发送定时
- (void)broadcastLooper {
    //启动一个定时器 循环的发送广播
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(broadcast) userInfo:nil repeats:YES];
}

- (void)broadcast {
    //1. 取得通知中心
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 定义发送内容
    static int i;
    NSString *count = [NSString stringWithFormat:@"bcast %d", i++];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"BJ broadcast", @"Name",
                          count, @"Value",
                          nil];
    
    //2. 发送广播 参数1: 表示广播的频段
    [nc postNotificationName:@"BJBroadcast" object:self userInfo:dict];
}

@end
