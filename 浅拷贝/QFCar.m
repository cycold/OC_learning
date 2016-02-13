//
//  QFCar.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "QFCar.h"

@implementation QFCar


// 实现NSCopying协议方法:
// 这个方法,是当对象调用copy方法时,就会调用这个方法
- (id)copyWithZone:(NSZone *)zone {
    // 新分配一块空间(对象)
    QFCar *car = [[[self class] allocWithZone:zone] init];
    car.name = self.name;
    car.year = self.year;
    NSLog(@"c------: %@ year: %d", car.name, car.year);
    return car;
}

// 实现NSMutableCopying协议方法
- (id)mutableCopyWithZone:(NSZone *)zone {
    // 新分配一块空间(对象)
    QFCar *car = [[[self class] allocWithZone:zone] init];
    car.name = self.name;
    car.year = self.year;
    NSLog(@"c------: %@ year: %d", car.name, car.year);
    return car;
}


@end
