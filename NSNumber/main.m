//
//  main.m
//  NSNumber
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 将基本数据类(数字)转成对象,以便于放入数组,字典中
 
 NSNumber: 是一个类簇, 他不是一个类,而是不同类的集合.
 通过调用不同的方法,创建不同的对象
 
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 将int 5 包装成对象
        NSNumber *intNum = [[NSNumber alloc] initWithInt:5];
        NSNumber *floatNum = [[NSNumber alloc] initWithFloat:5.00f];
        NSNumber *doubleNum = [[NSNumber alloc] initWithDouble:3.14];
        NSNumber *charNum = [[NSNumber alloc] initWithChar:'A'];
        NSNumber *boolNUm = [[NSNumber alloc] initWithBool:YES];
        
        NSLog(@"%@", intNum);
        NSLog(@"%@", floatNum);
        NSLog(@"%@", doubleNum);
        NSLog(@"%@", charNum);
        NSLog(@"%@", boolNUm);
        
        // 大小的比较
        NSNumber * intNum2 = [NSNumber numberWithInt:6];
        
        BOOL ret = [ intNum isEqualToNumber:intNum2];
        ret = [ intNum isEqualToNumber:floatNum];
        
        NSLog(@"%d", ret);
        
        if ([intNum compare:intNum2] == NSOrderedAscending) {
            NSLog(@"intNum < intNum2");
        } else if([intNum compare:intNum2] == NSOrderedSame) {
            NSLog(@"intNum == intNum2");
        } else if ([intNum compare:intNum2] == NSOrderedDescending) {
            NSLog(@"intNum > intNum2");
        }
        
        // 变回(还原)基本类型
        NSLog(@"%d", [intNum intValue]);
        NSLog(@"%f", [floatNum floatValue]);
        NSLog(@"%f", [doubleNum doubleValue]);
        
    }
    return 0;
}
