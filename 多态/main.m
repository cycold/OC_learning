//
//  main.m
//  多态
//
//  Created by icewater on 2/9/16.
//
//

#import <Foundation/Foundation.h>
//#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *p = [[Person alloc] init];
        [p sayHi];
        
        // 调用类方法
        [Person print];
        
        Student *s = [[Student alloc] init];
        [s sayHi];
        [s print];
        [s printScore];
        
        // 设置方法 setter, getter;
        s.Age = 12;
        s.Salary = 2000;
        [s print];
        [s printAll];
    
        // NSLog(@"age: %d", s->_age);
        
        // student继承自person都有sayHi方法.
        // 现在父类指针指向子类对象
        Person *a = [[Student alloc] init];
        // [a sayHi] 分两步:
        // 首先: 编译器级别最多能知道a是一个指向person的指针,这里调用sayHi方法,那么Person类一定要有sayHi方法
        // 其次: 运行时,a实际是拿到了student对象的地址,所以就会调用student类中sayHi方法.
        // 这就是动态绑定,一切都是运行时确定,编译时只是检查表面错误.
        [a sayHi];
        
        // 调用类方法
        [Student print];
        
        
    }
    return 0;
}
