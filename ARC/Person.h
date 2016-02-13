//
//  Person.h
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

//@property (nonatomic,strong) Dog *dog;
@property (nonatomic,weak) Dog *dog;
@end
