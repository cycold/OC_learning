//
//  PlayIterm.m
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import "PlayItem.h"

@implementation PlayItem




// 此方法,是使用KVC设置对象中不存在的属性时就会触发此方法,从而不会crash
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"function: %@ is calling...", NSStringFromSelector(_cmd));
}

@end
