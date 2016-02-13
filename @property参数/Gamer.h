//
//  Gamer.h
//  OC_learning
//
//  Created by icewater on 2/11/16.
//
//

#import <Foundation/Foundation.h>

@class House;

@interface Gamer : NSObject

//{
//    House *_house; // 有指向对象,要在set,dealloc方法中做内存管理
//}
//
//- (void)setHouse: (House *)house;
//- (House *)house;

// 可以使用@property生成内存管理代码

@property (retain) House *house;

@end
