//
//  NSString+ReverseString.m
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)

- (id)reverseString {
    
    // self 表示字符串本身,表示当前类
    NSUInteger len = [self length];
    
    NSMutableString *str = [NSMutableString stringWithCapacity:len];
    
    while (len > 0) {
        // 从后取一个字符 unicode 2个字节
        unichar c = [self characterAtIndex: --len];
        NSLog(@"c is %C", c);
        NSString *s = [NSString stringWithFormat:@"%C", c];
        [str appendString:s];
    }
    
    return  str;
}

@end
