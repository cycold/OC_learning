//
//  QFCar.m
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import "QFCar.h"

@implementation QFCar

- (NSString *)description {
    return [NSString stringWithFormat:@"car name: %@, year: %d", _name, _year];
}

// 实现NSCopying协议方法
- (id)copyWithZone:(NSZone *)zone {
    QFCar *c = [[[self class] allocWithZone:zone] init];
    c.name = self.name;
    c.year = self.year;
    return c;
}

// 实现NSCoding协议方法
// 存档方法实现
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeInt:self.year forKey:@"Year"];
}

// 解档方法实现
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.year = [aDecoder decodeIntForKey:@"Year"];
        self.name = [aDecoder decodeObjectForKey:@"Name"];
    }
    return self;
}



@end
