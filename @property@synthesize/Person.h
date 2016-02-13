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
    int _age;
}

//{
//    @protected
//        int _age;
//        BOOL _sex;
//        float _height, _weight;
//    
//    @public
//        NSString *_name;
//
//    @private
//        NSUInteger _salary;
//}
//
//@property (assign) int age;
//@property NSString *name;
//@property BOOL sex;
//@property NSUInteger salary;


//@property int age;
//1) 生成_age (会自动生成带下划线的成员变量)
//2) 生成_age的get和set方法的声明
//3) 实现_age的get和set方法

@property int age;
@property BOOL sex;
@property float height;
@property float weight;
@property NSString *name;
@property NSUInteger salary;

// 使用@property 设置的属性,子类不会继承,都是私有属性

- (void)sayHi;

//- (void)setName: (NSString *)name;
//- (NSString *)Name;
//
//- (void)setAge: (int)age;
//- (int)Age;
//
//- (void)setSex: (BOOL)sex;
//- (BOOL)Sex;
//
//- (void)setSalary: (NSUInteger)salary;
//- (NSUInteger)Salary;

- (void)print;

+ (void)print;


@end
