//
//  main.m
//  类扩展
//
//  Created by icewater on 2/11/16.
//
//

/**

 // 在OC中其实,尽管父类的成员变量是私有的也都是可以继承过来的.
 // 但是如果要操作这些私有变量,那么必须使用父类的方法.
 // 如果父类的成员变量使用protected修饰,那么在子类中直接可以操作,不需要使用父类提供的方法
 
 // OC中的私有成员变量,只能通过方法访问,
@property来声明创建一个属性: 这个属性为private
 这个结果应该可以说明private修饰的属性是可以被子类继承的。所以，平常仅仅使用一个@property来声明创建一个属性，
 这个属性的属性是private，子类可以继承使用这个属性，只不过需要通过父类提供的函数而已
 子类可以继承父类的私有属性，但是，如果父类没有为子类提供操作这个私有属性的函数，那么纠结继承与否已经没有什么意义了
 
 
 @interface Person ()
 
 // 这里使用@property属性,直接在.m文件中,实用类扩展,默认是不会生成setter,getter方法的,所以这个变量就变成了私有,外届无法访问
 // 关键: 控制@property是否生成setter,getter方法; OC它规定只要在.m文件并且是在类扩展(匿名分类)中声明的变量都不能生成setter,getter方法
 // 这样OC就实现了私有变量的封装, 同时规定其申明的方法,对象也无法访问, 只能在其内部通过self关键字调用
 @property (nonatomic, assign) int score;
 
 - (int)getedScore;
 
 @end

 
 
 注意:  定义在扩展类中而且是直接定义在.m文件的@property属性,是自动不会展开setter,getter方法,所以外界就无法访问
       除非手动实现setter,getter方法
       而如果扩展类(匿名分类)是定义在.h文件中那么@property就会自动生成setter,getter.对象就可以直接通过dot语法访问
 
 */


#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person_ext.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        p.height = 178;
        p.weight = 65;
        
        p.age = 25;
        
        [p hello];
        
        [p sayAge];
        
        //[p getedScore];
        
        // score是定义在.m文件中扩展类中,@property (nonatomic, assign) int score; 不会默认生成setter,getter函数
        // p.score = 12;
        
        Student *stu = [Student new];
        stu.age = 17;
        stu.height = 178.00;
        //stu.score = 12;
        //[stu sayAge];
        
        // [stu getedScore];
        // stu.score;
        
        [stu print];
        
        // 可以设置luck,
        stu.luck = @"luck,,,";
        
        [stu valueForKey:@"score"];
        
        NSLog(@"end...");

        
        
    }
    return 0;
}
