//
//  main.m
//  MSMutableString
//
//  Created by icewater on 2/9/16.
//
//

#import <Foundation/Foundation.h>


/**
 
 可变字符串: 字符串 (继承自字符串)
 NSMutableString: NSString
 NSString中的方法,在可变字符串中都是可以使用的
 可变字符串,他自己还有一些特有的方法: 曾, 删, 改, 查
 */


void initMutableStr(){
    // 创建可变字符串,不能直接这样创建: 因为表达式@"hello"表示创建一个不可变字符串
    // NSMutableString *str = @"hello";
    
    // 其他都和之前NSString创建的方法一样,比如
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"hi, 你好"];
    NSLog(@"str: %@", str);
    
    // 或者首先创建一个空的可变字符串
    str = [[NSMutableString alloc] init];
    // 然后设置可变字符串
    [str setString:@"hi,你是一个好人"];
    
    // 如果再次设置就会发生替huan
    [str setString:@"hi,你好坏!"];
    
    NSLog(@"str: %@", str);
    
    // 可变字符串的追加
    [str appendString:@"123"];
    NSLog(@"str: %@", str);
    
    // 追加格式符
    [str appendFormat:@"%c", 'F'];
    NSLog(@"str: %@", str);
    
    // 字符串的插入 在索引atIndex处开始插入字符串
    [str insertString:@"XXXX" atIndex:1];
    NSLog(@"str: %@", str);
    
    // 使用一个临时字符串插入
    [str insertString:[NSString stringWithFormat:@"%d", 5] atIndex:1];
     NSLog(@"str: %@", str);
    
    // 删除部分字符串 从第2个字符开始,删除4个字符(包括第2个),一个范围内的字符
    [str deleteCharactersInRange:NSMakeRange(2, 4)];
    NSLog(@"str: %@", str);
    
    // 修改部分字符
    [str replaceCharactersInRange:NSMakeRange(1, 6) withString:@"xxx"];
    NSLog(@"str: %@", str);
}

void test(){
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        initMutableStr();
    }
    return 0;
}
