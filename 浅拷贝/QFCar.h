//
//  QFCar.h
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>

// 实现NSCopying协议,使对象可以copy
// 也可以使用NSMutableCopying协议,一般不常用
@interface QFCar : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, assign) int year;
@property (nonatomic, copy) NSString *name;

@end
