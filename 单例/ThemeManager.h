//
//  ThemeManager.h
//  OC_learning
//
//  Created by icewater on 2/13/16.
//
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject

@property (nonatomic, strong) NSString *name;

// 单例一般都是使用类方法 单例命名一般为: sharedXXXX, defaultXXXX, currentXXXX
+ (id)sharedThemeManager;

@end
