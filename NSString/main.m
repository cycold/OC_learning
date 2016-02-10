//
//  main.m
//  NSString
//
//  Created by icewater on 2/9/16.
//
//

#import <Foundation/Foundation.h>

// 字符串初始化的几种方法
void NSinit(){
    
    // OC字符串都是对象, 由一个NSString类来创建,创建字符串,就是创建对象
    
    // 创建的字符串之后, 是无法再次改变的, 也称为不可变字符串
    
    // 1 直接字面量
    // NSString *s = @"hello a";
    
    // 2 创建一个空的字符串内存
    NSString *ss = [[NSString alloc] init];
    ss = @"world b";
    
    // 3 使用一个已存的字符串初始化
    NSString *sss = [[NSString alloc] initWithString:ss];
    
    NSLog(@"%@", sss);
    NSLog(@"%p", ss);
    NSLog(@"%p", sss);
    
    // 4 使用格式符号,拼接成一个OC字符串对象
    NSString *t = [[NSString alloc] initWithFormat:@"hi, %s", "tom"];
    NSLog(@"%@", t);
    
    // 5. 使用一个c语言的字符串来创建一个OC字符串
    NSString *tc = [[NSString alloc] initWithUTF8String: "hi, 你好"];
    NSLog(@"%@, length: %lu", tc, tc.length);
    
    //[ss release];
    
}


// 创建临时字符串的方法,不需要手动release,将会自动放入内存释放池中
// 注意都是使用类方法
// 创建的字符串, 是无法再次改变的
void createStr(){
    NSString *sa = [NSString stringWithString:@"hi, 你好"];
    NSString *sb = [NSString stringWithFormat:@"hi, %s", "你好"];
    NSString *sc = [NSString stringWithUTF8String:"hi, 你好"];
    
    NSLog(@"sa: %@, length: %lu", sa, sa.length); // 6
    NSLog(@"sb: %@, length: %lu", sb, sb.length); // 10
    NSLog(@"sc: %@, length: %lu", sc, sc.length); // 6
}


// NS字符串长度计算
void NSLength(){
    NSString *s = @"Hi, 你好";
    NSLog(@"Length: %lu", s.length); // 6
    NSLog(@"Length: %lu", [s length]); // 6 个字符, 这里打印的是字符串的个数, OC字符串采用UTF8编码
}

// OC兼容C语言的字符串
void test(){
    char *cs = "hi, 你好";
    NSLog(@"%s", cs); // hi, ‰Ω†Â•Ω 居然打印乱码
    NSLog(@"length: %lu", strlen(cs)); // 10 byte, c语言中1个汉字占用3个字节, 这里打印的是字符串占用的字节数
}


/**
 
 那么,OC的字符串,相对于C语言的字符串,有何优势呢?
  OC字符串,作为一个对象,其本身就自带有各种处理字符串的消息(方法),对象可以就收消息.
 */

// 字符串对象本身的方法

void strMethods(){
    
    NSString *sa = @"Hi, 你好";
    NSString *sb = @"Hi, 你好";
    NSString *sc = @"ci, 你好";
    NSString *sd = @"di, 你好";
    
    // 比较两个字符串是否相等, 使用字符串对象自带的方法
    BOOL ret = [sa isEqualToString:sb];
    NSLog(@"isEauqal: %d", ret);

    // 两个字符串比较compare, 返回结果为枚举类型
    // typedef NS_ENUM(NSInteger, NSComparisonResult) {NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};
    NSComparisonResult ren = [sc compare: sd];
    if (ren == NSOrderedAscending) { //升序
        NSLog(@"sc < sd");
    } else if (ren == NSOrderedDescending) { // 降序
        NSLog(@"sc > sd");
    } else if (ren == NSOrderedSame) { // 相同
        NSLog(@"sc == sd");
    }
    
    // 子字符串的查找
    NSString *str = @"hi,你是一个好人!";
    NSString *subStr = @"好人";
    // - (NSRange)rangeOfString:(NSString *)searchString;
    // typedef struct _NSRange {
    //     NSUInteger location;
    //     NSUInteger length;
    // } NSRange;
    NSRange range = [str rangeOfString:subStr];  // 在字符串str中查找字符串subStr的位置,返回值为一个结构体
    NSLog(@"location: %lu, length: %lu", (unsigned long)range.location, range.length); // 8, 2
    
    // 字符串的提取
    // substringToIndex 表示从字符串str中,从0开始,直到第6个字符,不包括第6个
    // 注意这是生成一个新字符串,没有操作原来的字符串
    NSString *stra = [str substringToIndex: 6];
    NSLog(@"stra: %@", stra);
    
    // substringFromIndex 表示从字符串str中,从第6个字符开始(包括第6个字符串),直到字符串尾,生成一个新的字符串
    NSString *strb = [str substringFromIndex: 6];
    NSLog(@"strb: %@", strb);
    
    // 根据指定范围提取字符串
    NSRange arange = {3, 2}; // 表示从第3个字符开始(开始提取2个字符,包括第三个字符),生成一个新的字符串
    NSString *strc = [str substringWithRange: arange];
    NSLog(@"strc: %@", strc); //你是
    
    arange.length = 3;
    strc = [str substringWithRange: arange];
    NSLog(@"strc: %@", strc); //你是一
    
    // 直接创建一个range,每一个都要修改比较麻烦, 使用函数 NSMakeRange(3, 3), 会返回一个结构体
    strc = [str substringWithRange: NSMakeRange(3, 3)];
    NSLog(@"strc: %@", strc); //你是一
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        NSinit();
//        NSLength();
//        createStr();
        
        strMethods();
    }
    return 0;
}
