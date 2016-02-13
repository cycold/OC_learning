//
//  Gamer.m
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import "Gamer.h"

@implementation Gamer

- (void) dealloc {
    NSLog(@"Gamer dealloc...");
    
    // 对象释放前,需要释放引用的其他的对象
    [_house release];
    [super dealloc];
}

//- (void)setHouse: (House *)house {
//    // 当设置新的值时,需要对旧值进行一次release
//    if (_house != house) {
//        
//        [_house release];
//        
//        _house = [house retain];
//    }
////    [house retain];
////    _house = house;
//}
//
//- (House *)house {
//    return _house;
//}

@end
