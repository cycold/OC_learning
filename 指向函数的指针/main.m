//
//  main.m
//  指向函数的指针
//
//  Created by icewater on 2/13/16.
//
//

/**
 C语言中,指针几乎可以指向任何东西.指针在指向前,一定需要确定其指向的类型.
 那么指向函数的指针,类型是什么?怎么定义这个类型?
 
 使用如下的形式定义指向函数的指针: 
 (*p) --> 指向函数, 指向怎样的函数?
 void (*p) --> 指向返回值为void的函数, 那参数呢?
 void (*p)(int, int), (void) (*p)() 
 
 c语言函数必须有返回值,参数
 
 so,完整的指向函数的指针声明格式:
 
 返回值类型 (*p) (参数列表)
 
 */

#import <Foundation/Foundation.h>


int sum(int a, int b) {
    return a + b;
}

// 一般使用typedef 自定义某一函数类型
// 这里定义了一种函数类型Myfun,
// 只要是返回值为int, 有两个参数都是int类型,那么的这样的函数都可以赋值给这种类型的变量
typedef int(*Myfun)(int, int);

int sayHi(int a, int b) {
    NSLog(@"Hello, sum: %d", a + b);
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 声明一个指向某一类型函数的指针
//        int (*ps)(int, int);
        
        // 是p指向符合这一类型的具体的函数, 注意函数名就是函数的地址
        // p = sum;
        
        // 或者在声明的同时进行赋值
        int (*p)(int, int) = sum;
        
        // 函数指针的几种调用方法
        int res = p(1,2);
        
        // int res = (*p)(1,2);
        
        // int res = sum(1,2);
        
        Myfun foo = sayHi;
        Myfun boo = sum;
        
        foo(6,2);
        boo(12,4);
        
//        Myfun aoo = {
//            
//        }
        
        NSLog(@"%d", res);
        
    }
    return 0;
}
