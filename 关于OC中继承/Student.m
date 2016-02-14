//
//  Student.m
//  OC_learning
//
//  Created by icewater on 2/15/16.
//
//

#import "Student.h"

@implementation Student

- (void)print {
    // 在子类student中,发现只有luck可以直接再次操作
    luck = @"hi , luck";
    
    // 这里不能操作age, height, weight, score
    // age = 12;
    
    // 在OC中其实,尽管父类的成员变量是私有的也都是可以继承过来的.
    // 但是这些如果要操作这些私有变量,那么必须使用父类的方法.
    // 如果父类的成员变量使用protected修饰,那么在子类中直接可以操作,不需要使用父类提供的方法
}

- (NSString *)luck {
    return  luck;
}

- (void)setLuck:(NSString *)aLuck {
    luck = aLuck;
}

@end
