//
//  main.m
//  NSDictionary
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 字典中的元素是以键值对的形式存储的
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 创建一个字典对象
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"one", @"1", @"two", @"2", @"three", @"3", nil];
//        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"one", @"1", @"two", @"2", @"three", nil]; // 需要键值对配对
        // 字典中的元素是以键值对的形式存储的
        // @"one", @"1" 组成了一个键值对, @"one"称为值(value), @"1"称为键(key);
        // 值和键都是任意的对象,一般键通常是使用字符串
        // 字典存储对象的地址没有顺序,但是数组是有顺序的
        
        // 打印字典中的元素, 打印的时候,不考虑顺序
        NSLog(@"%@", dict);
        
        
        // 字典对象的字面量的创建方法 , 注意数字18需要转成OC对象,前面使用@符号就直接转为NSSNumer对象了
        NSDictionary *d1 = @{@"name": @"张三", @"age": @18, @"height": @173};
        NSDictionary *d2 = @{@"name": @"李四", @"age": @28, @"height": @178};
        NSDictionary *d3 = @{@"name": @"王五", @"age": @19, @"height": @185};
        
        NSLog(@"name: %@ age: %@ height: %@", d1[@"name"], d2[@"age"], d3[@"height"]);
        
        
        // 字典的遍历
        // 1. 使用枚举器法遍历,分为值和键的遍历
        NSEnumerator *enumer = [dict keyEnumerator]; // keyEnumerator 键的遍历, 按照存储的顺序遍历
        id obj;
        while (obj = [enumer nextObject]) {
            NSLog(@"%@", obj);
        }
        
        enumer = [dict objectEnumerator]; // objectEnumerator 值的遍历
        while (obj = [enumer nextObject]) {
            NSLog(@"%@", obj);
        }
        
        // 通过键获取字典中的值
        NSString *str = [dict objectForKey:@"1"];
        NSLog(@"%@", str);
        
        // 2. 快速枚举法
        for (id obj in dict) {
            NSLog(@"%@", obj);  //得到的是键
            //这里得到键,就能得到值
            NSLog(@"%@", [dict objectForKey:obj]);
        }
        
        
    }
    return 0;
}
