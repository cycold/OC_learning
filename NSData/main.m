//
//  main.m
//  NSData
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 NSData: 
    当需要写入文件,或者发送到网络,那么需要将数据转换为字节流(0,1二进制), 一字节一字节的0和1写入到文件中
    就是用来存储字节流的空间,类似c中的char buf[10] 缓冲区
 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 将字符串对象转换成字节流,写入文件
        
        NSString *str = @"hello world!";
        
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
        // 将data中存储的数据(二进制),通过字符串的形式一字节一字节的打印出来
        NSLog(@"%s", data.bytes);
        NSLog(@"%c", 97); // a
        
        // 将NSData对象转换成字符串
        
        NSString *newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"newStr: %@", newStr);
    }
    return 0;
}
