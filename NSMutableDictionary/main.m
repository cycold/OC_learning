//
//  main.m
//  NSMutableDictionary
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个可变字典
        NSMutableDictionary *mdict = [[NSMutableDictionary alloc] init];
        
        // 往字典中添加一个键值对, 注意这里是使用set, 不是add
        [mdict setObject:@"one" forKey:@"1"];  // 添加值 @"one", 键 @"1";
        [mdict setObject:@"two" forKey:@"2"];
        
        NSLog(@"%@", mdict);
        
        // 删除某一键值对, 通过传入的 key
        [mdict removeObjectForKey:@"1"];
        
        NSLog(@"%@", mdict);
    }
    return 0;
}
