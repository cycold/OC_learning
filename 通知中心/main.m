//
//  main.m
//  通知中心
//
//  Created by icewater on 2/13/16.
//
//

#if 0
 
 NSNotificationCenter: 通知中心,又叫广播中心
 1.如何创建通知中心
 2.如何发送消息(NSNotification)
 3.如何接受消息(NSNotification)
 
 通知中心: 是单例
 
 创建通知中心:
 NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
 
 消息类型:
 @interface NSNotification: NSObject <NSCopying, NSCoding>
 
 - (NSString *)name;
 - (id)object;
 - (NSDictionary *)userInfo;

 @end

 发送消息
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSString *)aName object: (id)anObject;
- (void)postNotificationName:(NSString *)aName object: (id)anObject userInfo:(NSDictionary *)aUserInfo;

 接收消息 回调机制
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

#endif


#import <Foundation/Foundation.h>
#import "Listener.h"
#import "BJBroadcast.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // BJBroadcast 北京广播电台
        // 听众
        
        // 创建一个广播站
        BJBroadcast *bj = [[BJBroadcast alloc] init];
        // 创建一个听众
        Listener *p = [[Listener alloc] init];
        
        [p wantToListen];
        
        // 一次性广播
        //[bj broadcast]; //如果是先发送,后监听,会没有效果,需要把listener放在广播前面
        
        // 循环广播
        [bj broadcastLooper];
        
        
        // 监听广播
        // [p wantToListen];
        
        // 如果有多个听众?, 都是可以收到广播
        Listener *p2 = [[Listener alloc] init];
        [p2 wantToListen];
        
        // 防止计数器退出
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}


















