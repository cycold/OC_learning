//
//  main.m
//  NSSet
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 
 NSSet 与 NSArray的区别: 
 集合没有存储顺序,没有重复元素, 采用哈希表,散列算法查找, 查找元素速度比数组要快
 一个有序,一个无序
 集合的每个元素都可以是任何的对象
 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建一个集合 会去掉重复的元素
        NSSet *set = [[NSSet alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", @"five", @"five", nil];
        
        NSSet *set2 = [[NSSet alloc] initWithObjects:@"one", @"three", @"two", @"four", @"five", nil];
        
        NSSet *set3 = [[NSSet alloc] initWithObjects:@"one", @"three", @"two", @"four", @"five", @"six", nil];
        
        NSLog(@"%@", set); // 无序
        
        // 获取集合中的元素的个数
        NSLog(@"%lu", [set count]); // 5
        
        // 判断集合中是否有某个元素
        BOOL ret = [set containsObject:@"one"];
        NSLog(@"ret: %d", ret);
        
        // 判断两个集合是否相等
        ret = [set isEqualToSet:set2];
        NSLog(@"==: %d", ret); // 1
        
        // 判断某个集合是否是另一个集合的子集合
        ret = [set isSubsetOfSet:set3];
        NSLog(@"subset: %d", ret);
        
        // 集合的遍历
        // 枚举器(迭代器)遍历
        NSEnumerator *enumer = [set objectEnumerator];
        id obj;
        while (obj = [enumer nextObject]) {
            NSLog(@"%@", obj);
        }
        
        // 通过提取数组的元素来创建一个集合
        NSArray *arr = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", @"five", @"five", nil];
        NSLog(@"%@", arr);
        
        // 会去掉数组中的重复元素
        NSSet *set4 = [[NSSet alloc] initWithArray:arr];
        NSLog(@"%@", set4);
        
        // 将集合的元素转为数组, 但是会将数组顺序打乱, 不保证顺序
        arr = [set allObjects];
        NSLog(@"arr: %@", arr);
        
    }
    return 0;
}
