//
//  PlayList.m
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import "PlayList.h"

@implementation PlayList

- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentItem = [[PlayItem alloc] init];
        self.itemList = [NSMutableArray array];
        for (int i = 0 ; i < 20; i++) {
            PlayItem *pi = [[PlayItem alloc] init];
            pi.name = [NSString stringWithFormat:@"name - %d", i];
            pi.price = 100 + i;
            [self.itemList addObject:pi];
        }
    }
    return self;
}

// 此方法,是使用KVC设置对象中不存在的属性时就会触发此方法,从而不会crash
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"设置属性: %@ 不存在", key);
    NSLog(@"file %s , function %@ is calling...", __FILE__, NSStringFromSelector(_cmd));
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"获取属性: %@ 不存在", key);
    NSLog(@"file %s , function %@ is calling...", __FILE__, NSStringFromSelector(_cmd));
    return 0;
}

@end
