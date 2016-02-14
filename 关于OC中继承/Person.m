//
//  Person.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "Person.h"
#import "Person_ext.h"

@interface Person ()

{
    int score2;
}

@property (nonatomic, assign) int score;

// 这是一个申明在类扩展中.m文件中的内部方法,外部对象都无法访问,只能通过其他方法的内部调用[self getedScore] 间接访问
- (int)getedScore;

@end

@implementation Person

- (void)hello {
    NSLog(@"height: %f", _height);
    NSLog(@"weight: %f", _weight);
    NSLog(@"age: %d", _age);
    NSLog(@"hello!");
}

- (void)sayAge {
    [self getedScore];
    NSLog(@"score----: %d", self.score);
    NSLog(@"sayage: %d", _age);
}

- (int)getedScore {
    NSLog(@"score>>>>: %d", _score);
    return _score;
}

- (int)score {
    NSLog(@"getter score...");
    return  _score;
}

@end
