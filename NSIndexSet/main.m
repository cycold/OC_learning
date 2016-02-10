//
//  main.m
//  NSIndexSet
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 注意: NSIndexSet 并不是 NSSet的子类, 它是NSSet的一个变种
      保存的都是数字
 */



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建一个索引集合 不可变的只能是连续的数字
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(2, 3)];
        
        // 可变的索引集合,可以添加不连续的数字集合
        NSMutableIndexSet *mindexSet = [[NSMutableIndexSet alloc] init];
        [mindexSet addIndex:2];
        [mindexSet addIndex:4];
        [mindexSet addIndex:0];
        
        NSLog(@"%@", indexSet); //集合中数字为 2, 3, 4
        
        // 从数组提取一大堆数字索引集合的元素这里为数组所以为2,3,4的元素
        
        NSArray *arr = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", @"six", nil];
        NSArray *narr = [arr objectsAtIndexes: indexSet];
        
        NSLog(@"%@", narr);
        
        narr = [arr objectsAtIndexes:mindexSet];
        
        NSLog(@"%@", narr);
        
    }
    return 0;
}
