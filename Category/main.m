//
//  main.m
//  Category
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

/**
 Category: (译为分类,类目,类别,非正式协议)
    实现继承之外的扩展方法机制
 1) Category能把一个类的实现分为若干不同文件中
 2) 每个Category是类的一部分
 3) 类的不同类别可以单独编译(可以让不同开发者负责一个Category)
 4) 如果把一个类Category(申明和实现)放到一个.m文件中,那么该Category外部就不能访问,这样就是现了类似c++中class的private功能
 5) Category实际上就是对类的扩展
 
 Category不能完全替代继承,但是可以实现继承中做不到的.
 
 注意: Category只能扩展函数,方法,消息,不能扩展字段,变量,所以这也就决定了Category不能替代继承
 
 Category的一般命名规范
 扩展名 + 扩展变量.[hm]
 比如:
    NSString+ReverseString.h
    NSString+ReverseString.m
 
    UIImageView+WebCache.h
    UIImageVIew+WebCache.m
 
 NSString+ReverseString.h
 
 ```
 #import <Foundation/Foundation.h>
 
 @interface NSString (分类名)   // 括号里面写的是唯一的字符:Category名称,主要表示分类的用途,可以为空那么就是一个匿名Category
 
 - (NSString *)reverseString;    // 写要扩展的方法,但是不能访问NSString中的私有变量
 
 @end

 ```
 
 2、分类的作用
 
 1）将1个类中的不同方法分到多个不同的文件中存储，便于对类进行模块化设计和团队开发。
 2）可以在不修改原来类的基础上，为这个类扩充一些方法。
 3）注意：
     分类中只能增加“方法”，不能增加成员变量。
     分类中可以访问原来类中的成员变量。
 
 
 3、使用分类的目的
 
 1）对现有类进行扩展:
    比如,你可以扩展Cocoa touch框架中的类,你在类别中增加的方法会被子类所继承,而且在运行 时跟其他的方法没有区别。
 2）作为子类的替代手段:
    不需要定义和使用一个子类,你可以通过类别直接向已有的类里增加方法。
 3）对类中的方法归类:
    利用category把一个庞大的类划分为小块来分别进行开发,从而更好的对类中的方法进行更新和维护。

 4. 分类的使用流程
 
    声明分类-->实现分类-->使用分类
    注意: 分类的命名规则:类名+扩展方法,如“NSString+countNum”。
         分类的接口声明与类的定义十分相似,但分类不继承父类,只需要带有一个括号,表明该分类的主要用途。
 
 字符串翻转Category方法实现
 */

#import "NSString+ReverseString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *s = @"hi,你好,世界,world!";
        NSString *reverseStr = [s reverseString];
        NSLog(@"reverseStr: %@", reverseStr);
    }
    return 0;
}
