//
//  main.m
//  常用结构体
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>


// 常用范围结构体
void range() {
    
    // 这里有三种方式,给NSRange 赋值
    
    // 1.直接赋值
    NSRange r1;
    r1.length = 10, r1.location = 20;
    
    // 2.使用c语言的聚合结构赋值
    NSRange r2 = { .location = 1, .length = 3 };
    NSRange r3 = { .length = 1, .location = 3 };
    
    // 3.使用Foundation框架的快捷函数NSMakeRange();
    NSRange range = NSMakeRange(8, 10);
    
    NSLog(@"location: %lu", (unsigned long)range.location);
    NSLog(@"length: %lu", (unsigned long)range.length);
    
    // NSLog(@"%@", range) // 错误,%@表示OC对象
    
    NSString *s = NSStringFromRange(range);
    NSLog(@"%@",s);
}

// 二维坐标, 这个结构表示平面中的一个点
void point() {
    // NSPoint 也等价于 CGPoint
    NSPoint p;  // CGPoint p;
    p.x = 1;
    p.y = 2;
    
    // 快速创建
    p = NSMakePoint(3.3, 4.3);
    // 或者使用 iOS中会经常使用CoreGraphics绘图框架,这里里面的类都是一CG开头
    // 还有经常使用的是CoreFoundation框架,里面的类都是以CF开头
    p = CGPointMake(3.14, 5);
    
    NSString *str = NSStringFromPoint(p);
    NSLog(@"%@", str);
}

// CGSize 这个结构提用来存储宽度和高度
// 可以用NSMakeSize()或者CGSizeMake()创建
void size() {
    // NSSize size;
    CGSize size;
    size.height = 12;
    size.width = 20;
    
    // 使用函数快速创建
    size = NSMakeSize(123, 1232);
    size = CGSizeMake(111, 222);
    
    NSLog(@"%@", NSStringFromSize(size));
}

// CGRect / NSRect 既保存位置,又保存尺寸
// struct CGRect {
//    CGPoint origin;  // 矩形左上角坐标
//    CGSize size;     // 矩形的宽度和高度
// };
// typedef struct CGRect CGRect;
// 可以使用CGRectMake()或者NSMakeRect()创建
void rect() {
    CGRect rect; // NSRect rect;
    rect.origin.x = 10;
    rect.origin.y = 111;
    
    // 不允许这样赋值
    // rect.origin = {10, 12};
    
    rect.size.width = 123;
    rect.size.height = 222;
    
    // 快速创建rect
    rect = NSMakeRect(4, 3, 2, 1);
    rect = CGRectMake(1, 2, 3, 4);
    
    
    NSLog(@"%@", NSStringFromRect(rect));
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // range();
        // point();
        // size();
        rect();
    }
    return 0;
}
