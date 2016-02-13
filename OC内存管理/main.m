//
//  main.m
//  OC内存管理
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

/**
 
 OC中的内存管理目前分为两部分: 
 MRC: Manual Reference Count 手动引用计数
 ARC: Automatic Reference Count 自动引用计数 这是Xcode编译器的默认选项
 
 内存管理的原理，要清楚两个概念:
    1）对象的所有权
    2）引用计数器

OC内存管理的范围: 管理任何继承NSObject的对象，对其他的基本数据类型无效。
 
对象的所有权:
    任何对象都可能拥有一个或多个所有者。只要一个对象至少还拥有一个所有者,它就会继续存在
Cocoa所有权策略:
    任何自己创建的对象都归自己所有,可以使用名字以“alloc”或“new”开头或名字中包含“copy”的方法创建对象,可以使用retain来获得一个对象的所有权。

对象的引用计数器:
    每个OC对象都有自己的引用计数器,是一个整数表示对象被引用的次数(有多少个所有者),即现在有多少东西在使用这个对象。
    对象刚被创建时,默认计数器值为1,当计数器的值变为0时,则对象销毁。
    在每个OC对象内部,都专门有8个字节的存储空间来存储引用计数器

引用计数器的常见操作
 retain消息：使计数器 +1（该方法返回对象本身）
 release消息：使计数器 -1（不代表释放对象）
 retainCount：获得对象当前的应用计数器值，输出：%ld %lu
 注意：release不代表销毁对象，仅仅是引用计数器-1
 
对象的销毁:
 当1个对象的应用计数器为0时，那么它将被销毁，其占用的内存被系统回收。(会将所有权移交给系统中的对象的动态链表)
 当对象被销毁时，系统会自动向对象发送一条dealloc消息。一般会重写dealloc方法，在这里释放相关的资源，dealloc就像是对象的“临终遗言”。
 一旦重写了dealloc方法，就必须调用[super dealloc]，并且放在代码块的最后调用。
 注意：不能直接调用dealloc方法。
 一旦对象被回收了，那么他所占用的存储空间就不再可用，坚持使用会导致程序崩溃（野指针错误）
 
 注意;
 1) 如果对象的计数器不为0,那么在整个程序运行过程,它占用的内存就不可能被回收(除非整个程序已经退出 )
 2) 任何一个对象,刚生下来的时候,引用计数器都为1。(对象一旦创建好,默认引用计数器就是1)当使用alloc、new或者copy创建一个对象时,对象的引用计数器默认就是1.
 
 内存管理的分类
 Objective-C提供了三种内存管理方式:
 1.MannulReference-Counting(MRC,手动管理,在开发iOS4.1之前的版本的项目时我们要自己负责使用引用计数来管理内存,
   比如要手动 retain、release、autorelease 等,而在其后 的版本可以使用 ARC,让系统自己管理内存。)
 2.automatic reference-counting(ARC,自动引用计数,iOS4.1之后推出的)
 3.garbage collection(垃圾回收)。iOS不支持垃圾回收;
 
 ARC作为苹果新提供的技术,苹果推荐开发者使用ARC技术来管理内存;
 开发中如何使用:需要理解MRC,但实际使用时尽量用ARC。
 
 
 内存管理研究内容
 
 1.野指针(僵尸对象)
 僵尸对象: 已经被销毁的对象(不能再使用的对象).
 野指针:指向僵尸对象(不可用内存)的指针.
 空指针: 没有指向存储空间的指针(里面存的是nil, 也就是0)
 2.内存泄露
 如果在程序结束后，对象没有被释放，此时称为内存泄露。
 
 内存管理的原则,谁retain,谁就release
 */


#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 当使用alloc或者new时,对象的引用计数器默认值会置为1
        Person *p = [[Person alloc] init];
        
        // 打印对象引用计数器的值: retainCount (注意这里需要关闭ARC, 在项目的Build Settings中设置)
        NSLog(@"retainCount: %lu", p.retainCount); // 1
        
        [p release]; // 将p对象的引用计数器减1 , 当计数器减到0后,在堆中的对象会移交所有权给系统管理(系统的动态链表),由系统来销毁对象
        
        // 为了防止后面无意的再次调用p指针,将其赋值为nil,给空指针发送任何消息都不会报错
        p = nil;
        
        // 开启target中的 Enable Zombie Objects  将会报错message sent to deallocated instance 0x100600220
        // 开启僵尸对象,观察对象回收
        NSLog(@"%lu", p.retainCount); // 如果正常的空间被回收,那么此时应该会保存
    
        
    }
    return 0;
}
