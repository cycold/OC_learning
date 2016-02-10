//
//  main.m
//  NSValue
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 NSNumber只能将数字(int,float,char,...)转成对象,但是不能将这些基本类型: 指针,结构体转成对象,
 so, 
 NSValue就是将指针,结构体包装成对象来使用
 
 NSValue 也是类簇
 

 */



// 定义一个结构体
struct sct {
    int a;
    int b;
}sctt = {3, 5};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个NSValue的对象 initWithBytes 第一个参数为结构体的地址,第二个参数是将需要包装的数据类型转换成特定的字符串
        NSValue *value = [[NSValue alloc] initWithBytes:&sctt objCType:@encode(struct sct)];
        
        // 比如,可以看到,encode是如何将int类型用特定的字符串表示的, 这些字符串是唯一的
        NSLog(@"%s", @encode(int)); // i , 用i表示int
        NSLog(@"%s", @encode(float)); // f , 用f表示float
        NSLog(@"%s", @encode(long)); // q , 用q表示long
        
        NSLog(@"%s", @encode(struct sct)); // {sct=ii} , 表示struct sct
        
        // 判断value对象的数据类型
        if (strcmp(value.objCType, @encode(struct sct)) == 0) {
            NSLog(@"struct sct...");
            NSLog(@"%s", value.objCType);
        }
        
        // 现在就将结构体sctt中内容放到了对象value中了,进而可以存储到集合,数组,字典中
        // 从value对象中,获取结构体数据
        
        struct sct newSctt;
        [value getValue: &newSctt]; // 将对象value中的结构体数据,转到结构体newSctt中
        
        NSLog(@"a: %d , b: %d", newSctt.a, newSctt.b);
        
        // 包装指针
        char *p = (char *)0x1f;
        NSValue *vp = [[NSValue alloc] initWithBytes:&p objCType: @encode(char *)];
        char *q;
        
        // 获取指针
        [vp getValue: &q];
        
        NSLog(@"%p", q); // 0x1f
        
        
        // 类簇
        // 根据存储的结构体的不同创建不同类的对象
        CGPoint point;
        CGSize size;
        CGRect rect;
        
        NSValue *pointValue = [NSValue valueWithPoint:point];
        NSValue *sizeValue = [NSValue valueWithSize:size];
        NSValue *rectValue = [NSValue valueWithRect:rect];
        NSValue *rangeValue = [NSValue valueWithRange:NSMakeRange(2, 4)];
        
    }
    return 0;
}
