//
//  Person.m
//  OC_learning
//
//  Created by icewater on 2/9/16.
//
//

#import "Person.h"

@implementation Person




- (instancetype)init {
    self = [super init];
    if (self) {
        self->_name = @"baby";
        _age = 1;
        _sex = 1;
        _salary = 1000;
    }
    return self;
}

- (void)sayHi {
    NSLog(@"hi,I am person!");
}

- (void)setName: (NSString *)name {
    self->_name = name;
}
- (NSString *)Name{
    return self->_name;
}

- (void)setAge: (int)age {
    self->_age = age;
}
- (int)Age {
    return _age;
}

- (void)setSex: (BOOL)sex {
    self->_sex = sex;
}
- (BOOL)Sex {
    return  _sex;
}

- (void)setSalary:(NSUInteger)salary{
    self->_salary = salary;
}
- (NSUInteger)Salary {
    return _salary;
}


// 如果没有在 @interface 中申明,直接在@implementation实现的方法,为私有方法,外部对象无法访问
- (void)print {
    NSLog(@"salary is : %lu",_salary);
    NSLog(@"age is : %i", _age);
}

+ (void)print {
    NSLog(@"hi, this is class methods");
}
@end

