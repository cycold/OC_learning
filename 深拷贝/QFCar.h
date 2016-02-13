//
//  QFCar.h
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>

@interface QFCar : NSObject <NSCopying, NSCoding>

@property (nonatomic, assign) int year;
@property (nonatomic, copy) NSString *name;

@end
