//
//  main.m
//  @property参数
//
//  Created by icewater on 2/11/16.
//
//

/**
 @property 格式: @property (参数1, 参数2, ...) 数据类型 方法名
    
    原子性 
        atomic : 对属性加锁,多线程下安全,@property参数默认值 建议在mac下使用
        nonatomic: 对属性不加锁, 多线程下不安全,但是速度快, 建议在手机端使用
    读写属性:
        readonly: getter, setter方法都会生成,默认值
        readonly: 只会生成getter方法
    set方法处理:
        assign: 直接赋值,不考虑内存管理,主要用于基本数据类型 默认
        retain: 先release原来的值,再retain新值
        copy:   先release原来的值,再copy新值
    设置set,get方法名称:
        setter: 方法名
        getter: 方法名
 
 
 @property (nonatomic, retain) House *house;
 @property (nonatomic, assign) int age;
 */

#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "House.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Gamer *g = [[Gamer alloc] init];
        House *h = [[House alloc] init];
        h.num = 12;
        
        g.house = h;
        
        [h release];
        
        g.house = h;
        
        [g release];
    }
    return 0;
}
