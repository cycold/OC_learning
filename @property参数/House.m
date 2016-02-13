
//
//  House.m
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import "House.h"

@implementation House

- (void) dealloc {
    NSLog(@"%d House dealloc...", _num);
    [super dealloc];
}

@end
