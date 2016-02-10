//
//  Person.m
//  OC_learning
//
//  Created by icewater on 2/9/16.
//
//

#import "Person.h"

@implementation Person
{
    int love;
}

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

// @property 增强用法,不再需要@synthesize
//@synthesize age;
//@synthesize age = _age;

//@synthesize age = _age, name = _name, salary = _salary, sex = _sex;


//- (void)setName: (NSString *)name {
//    self->_name = name;
//}
//- (NSString *)Name{
//    return self->_name;
//}
//
//- (void)setAge: (int)age {
//    NSLog(@"setting age");
//    self->_age = age;
//}
//- (int)Age {
//    NSLog(@"print age");
//    return _age;
//}
//
//- (void)setSex: (BOOL)sex {
//    self->_sex = sex;
//}
//- (BOOL)Sex {
//    return  _sex;
//}
//
//- (void)setSalary:(NSUInteger)salary{
//    self->_salary = salary;
//}
//- (NSUInteger)Salary {
//    return _salary;
//}

- (void)sayHi {
    NSLog(@"hi,I am person!");
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

