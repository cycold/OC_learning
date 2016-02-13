//
//  Person.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "Person.h"
#import "Person_ext.h"

@implementation Person

- (void)hello {
    NSLog(@"height: %f", _height);
    NSLog(@"weight: %f", _weight);
    NSLog(@"age: %d", _age);
    NSLog(@"hello!");
}

- (void)sayAge {
    NSLog(@"sayage: %d", _age);
}

@end
