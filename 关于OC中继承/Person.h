//
//  Person.h
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    
    NSString *luck;
}

@property (nonatomic) float height, weight;

- (void)hello;

@end
