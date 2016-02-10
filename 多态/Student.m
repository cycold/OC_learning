//
//  Student.m
//  OC_learning
//
//  Created by icewater on 2/9/16.
//
//

#import "Student.h"

@implementation Student
{
    int _score;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _score = 99;
    }
    return self;
}

- (void)sayHi{
    NSLog(@"老师好!");
}

- (void)printAll {
    // 子类中不能访问与父类中的私有成员变量_salary, 只能是有其父类中的方法访问
    // NSLog(@"printSalary: %lu", _salary);
    
    // 子类可以访问或者修改父类中的成员变量(protected,public)
    _age = 100;
    NSLog(@"age %i", _age);
}

- (void)printScore{
    NSLog(@"score: %d", _score);
}

@end
