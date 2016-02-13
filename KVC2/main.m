//
//  main.m
//  KVC2
//
//  Created by icewater on 2/14/16.
//
//

#import <Foundation/Foundation.h>
#import "PlayItem.h"
#import "PlayList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 测试KVC
        PlayList *pl = [[PlayList alloc] init];
        // 设置对象pl中name属性值为list
        [pl setValue:@"list" forKey:@"name"];
        NSLog(@"name is %@", pl.name);
        
        id v = [pl valueForKey:@"number"];
        NSLog(@"v is %@", v);
        
        // 设置pl中的currentItem字段中的name属性
        [pl setValue:@"当前播放列表" forKeyPath: @"currentItem.name"];
        NSLog(@"pl.currentItem.name is %@", pl.currentItem.name);
        
        //设置一批key, value
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"200", @"number",
                              @"列表", @"name"
                              , nil];
        [pl setValuesForKeysWithDictionary:dict];
        NSLog(@"name is %@, numer is %d", pl.name, pl.number);
        
        // 如果设置一个不存在的key? pl对象中没有test key, 可以通过一个默认的方法调用 - (void)setValue:(id)value forUndefinedKey:(NSString *)key
        [pl setValue:@"hello" forKey:@"test"];
        
        // 获取对象pl的属性itemList
        id obj = [pl valueForKey:@"itemList"];
        NSLog(@"obj is %@", obj);
        
        // 获取对象pl不存在的属性test
        obj = [pl valueForKey:@"test"];
        NSLog(@"obj is %@", obj);
        
        // 获取字段中属性, 注意这里会把数组中元素的name字段放到一个数组中返回
        id obj2 = [pl valueForKeyPath:@"itemList.name"];
        NSLog(@"obj2.name is %@", obj2);
        
        // KVC的计算 @sum 表示计算总和 @avg 表示求平均值
        NSLog(@"itemlist price sum is %@", [pl.itemList valueForKeyPath:@"@sum.price"]); // 2190
        NSLog(@"itemlist price avg is %@", [pl.itemList valueForKeyPath:@"@avg.price"]); // 109.5
        NSLog(@"itemlist price max is %@", [pl.itemList valueForKeyPath:@"@max.price"]); // 119
        NSLog(@"itemlist price min is %@", [pl.itemList valueForKeyPath:@"@min.price"]); // 100
        NSLog(@"itemlist price count is %@", [pl.itemList valueForKeyPath:@"@count.price"]); // 20
    }
    return 0;
}
