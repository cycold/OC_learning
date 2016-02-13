//
//  Foo.m
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//


/**
 使用Category封装私有方法
 */

#import "Foo.h"


@interface Foo (Private) // Private可写可不写,一般写上Private

- (void) test2;

@end


@implementation Foo

- (void) test{
    // 这里由于test2函数申明写在了后面,所以会报错,可以在.h文件申明,但是在.h文件中就会暴露方法名,此时可以使用Category解决,将其放在Category中申明即可
    [self test2];
}

- (void) test2{
    NSLog(@"test2 is calling....");
}


@end
