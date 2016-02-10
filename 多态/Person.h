//
//  Person.h
//  OC_learning
//
//  Created by icewater on 2/9/16.
//
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @protected
        int _age;
        BOOL _sex;
        float _height, _weight;
    
    @public
        NSString *_name;

    @private
        NSUInteger _salary;
}



- (void)sayHi;

- (void)setName: (NSString *)name;
- (NSString *)Name;

- (void)setAge: (int)age;
- (int)Age;

- (void)setSex: (BOOL)sex;
- (BOOL)Sex;

- (void)setSalary: (NSUInteger)salary;
- (NSUInteger)Salary;

- (void)print;

+ (void)print;


@end
