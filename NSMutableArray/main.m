//
//  main.m
//  NSMutableArray
//
//  Created by icewater on 2/10/16.
//
//

#import <Foundation/Foundation.h>

/**
 可变数组是不可变数组的子类,会具有不可变数组的所有方法
 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"hello", @"你好", @"旺旺",nil];
        
        // 中文打印的是其Unicode码
        NSLog(@"%@", arr);
        
        // 或者直接创建一个空数组
        arr = [[NSMutableArray alloc] init];
        NSLog(@"%@", arr);
        
        // 往空数组中增加元素
        [arr addObject:@"first"];
        [arr addObject:@"hello"];
        [arr addObject:@"你好"];
        [arr addObject:@"你好"];
        [arr addObject:@"你好!"];
        [arr addObject:@"world!"];
        [arr addObject:@"last!"];
        
        NSLog(@"%@", arr);
        
        // 删除指定的元素 (传入地址), 字符串相等,地址都相等
        [arr removeObject:@"你好"]; // 注意这里的字符串"你好"保存的地址都是一样,所以这里会删除所有的"你好"
        
        NSLog(@"%@", arr);
        
        // 删除最后一个元素
        [arr removeLastObject];
        NSLog(@"%@", arr);
        
        // 删除指定索引的元素
        [arr removeObjectAtIndex:0];
        NSLog(@"%@", arr);
        
        // 交换两个数组元素的位置 0 和 2交换
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:2];
        NSLog(@"%@", arr);
        
        // 可变数组的遍历和不可变数组的遍历方法相同,
        // 但是唯一需要注意的就是, 枚举器法遍历和快速枚举器法, 不能在遍历的过程中修改数组元素或者顺序
        
        arr = [[NSMutableArray alloc] initWithObjects:@"one", @"two", @"three", @"four", nil];
        
        // 枚举器法遍历, 获得数组元素的枚举器
        NSEnumerator *enumerator = [arr objectEnumerator];
        NSString *str;
        int i = 0;
        while (str = [enumerator nextObject]) {
            NSLog(@"%@", str);
            // 移除最后一个元素,但是在枚举器法当中是不能改变数组的, 所以会报错误
            // [arr removeLastObject];
            NSLog(@"%d", i++);
        }
        i = 0;
        // 但是如果生成一个逆序枚举器,又可以在遍历时修改元素
        enumerator = [arr reverseObjectEnumerator];
        while (str = [enumerator nextObject]) {
            NSLog(@"%@", str);
            // 移除最后一个元素, 在逆序枚举器中是可以修改数组元素
            [arr removeLastObject];
            NSLog(@"%d", i++);
        }
        
        // 此时数组应该是空的
        NSLog(@"%@", str); // null
        
        // i值遍历法,是可以对可变数组的元素和顺序进行修改
        void rts();
        rts();
    }
    return 0;
}

// 字符串和数组的联合, 使一个字符串逆序
void rts(){
    NSString *str = @"You are a good man, 你是一个好人!";
    
    // 将字符串进行分割, 放到数组里面
    NSArray *arr = [str componentsSeparatedByString:@" "];
    
    NSMutableArray *marr = [[NSMutableArray alloc] init];
    
    // 对数组进行逆序遍历
    NSEnumerator *enumerator = [arr reverseObjectEnumerator];
    id obj;
    while(obj = [enumerator nextObject]) {
        [marr addObject: obj];
    }
    
    NSLog(@"%@", marr);
    
    // 将数组的元素拼成一个新的字符串
    NSString *newStr = [marr componentsJoinedByString:@" "];
    
    // 这里的中文没有达到效果? ...
    NSLog(@"%@", newStr);
    
}
