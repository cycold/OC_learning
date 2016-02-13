//
//  PlayList.h
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import <Foundation/Foundation.h>

#import "PlayItem.h"
//@class PlayItem;

@interface PlayList : NSObject

@property (nonatomic, assign) int number;
@property (nonatomic, strong) NSString *name;

// 当前播放列表
@property (nonatomic, strong) PlayItem *currentItem;
@property (nonatomic, strong) NSMutableArray *itemList;

@end
