//
//  main.m
//  NSMutableSet
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 NSMutableSet: NSSet
 可变集合是NSSet的子类
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableSet *set = [[NSMutableSet alloc] init];
        // 动态的添加元素
        [set addObject:@"one"];
        [set addObject:@"two"];
        [set addObject:@"three"];
        [set addObject:@"three"]; // 元素有重复,只会保留一个元素
        [set addObject:@"four"];
        
        NSLog(@"%@", set);
        
        // 从集合(可变)中删除元素
        [set removeObject:@"two"];
        NSLog(@"%@", set);
        
        NSSet *set2 = [[NSSet alloc] initWithObjects: @"1", @"2", @"three", @"four", nil];
        
        // 集合的合并 set, set2, 将set2中内容合并到set中, 会去掉重复的元素
        [set unionSet:set2];
        NSLog(@"unionset: %@", set);
        
        // 集合的差异 从集合set中减去与set2相同的元素
        [set minusSet:set2];
        NSLog(@"minusset: %@", set);
        
        
    }
    return 0;
}
