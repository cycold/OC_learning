//
//  main.m
//  多态
//
//  Created by icewater on 2/9/16.
//
//

/**
    使用 property 注意,自动生成的为private变量,子类无法访问.
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
