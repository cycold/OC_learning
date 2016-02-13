//
//  main.m
//  多态
//
//  Created by icewater on 2/9/16.
//
//

/**
    使用 property 注意,自动生成的为private变量,子类无法访问.
 
  // 使用@property 设置的属性,子类不会继承,都是私有属性
  // 如果没有使用synthesize 指定,那么就会生成带下划线的属性
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h" 

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.age = 12;
        NSLog(@"age: %d", p.age);
        p.name = @"hh";
        // p->love = 1;
        
        Student *s = [[Student alloc] init];
        
    }
    return 0;
}
