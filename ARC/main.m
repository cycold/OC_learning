//
//  main.m
//  ARC
//
//  Created by icewater on 2/11/16.
//
//

/**
 1、ARC特点总结
 
 1）不允许调用release,retain,retainCount
 2）允许重写dealloc,但是不允许调用[super dealloc]
 3）@property的参数:
     strong:相当于原来的retain(适用于OC对象类型),成员变量是强指针
     weak:相当于原来的assign,(适用于oc对象类型),成员变量是弱指针
     assign:适用于非OC对象类型(基础类型)
 
 ARC使用注意事项:
 1）ARC中,只要弱指针指向的对象不在了,就直接把弱指针做清空(赋值为nil)操作。
 2）__weak Person *p=[[Personalloc]init];//不合理
 对象一创建出来就被释放掉,对象释放掉后,ARC把指针设置为nil。
 
 3）ARC中在property处不再使用retain,而是使用strong,在dealloc中不需要再 [super dealloc]。
    @property(nonatomic,strong)Dog *dog; // 意味着生成的成员变量_dog是一个强指针,相当于以前的retain。
    @property(nonatomic,weak)Dog *dog; // 意味着生成的成员变量_dog是一个弱指针

 
 强弱指针
 
    强指针：
         默认所有的指针变量都是强指针。
         被__strong修饰的指针。
    弱指针：
         被__weak修饰的指针
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        __strong Person *p = [[Person alloc] init];
        
        // __weak Person *p2 = [[Person alloc] init]; //对象一创建完就被释放
        
        // NSLog(@"%@", p); //
        // NSLog(@"%@", p2); // null
        
        Dog *d = [[Dog alloc] init];
        
        // 设置人拥有狗
        p.dog = d;
        
        // 设置狗有主人 此时两对象循环引用
        d.master = p;
        
        p = nil;
        
        // 此时没有对象被dealloc
        // 在ARC情况下解决”循环retain”的问题:@property一边用strong,一边用weak。
        // 此时两个对象都被释放了

    }
    return 0;
}
