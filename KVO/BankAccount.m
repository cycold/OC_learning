//
//  BankAccount.m
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import "BankAccount.h"

@implementation BankAccount

- (instancetype)init {
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(balanceUpdate:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)balanceUpdate: (id)arg {
    float f = self.openingBalance;
    f += arc4random() % 100; // 取0 到 100的随机数
    
    // 关于这里赋值,一共有好几种方法
    //1.
    //self.openingBalance = f;
    
    //2.
    //[self setOpeningBalance:f];
    
    //3.kvc写法 注意不能传基本类型
    //[self setValue: [NSNumber numberWithFloat:f] forKey:@"openingBalance"];
    
    //4
    [self willChangeValueForKey:@"openingBalance"];
    _openingBalance = f;
    [self didChangeValueForKey:@"openingBalance"];
    
    
    
    // 注意: 不能直接使用下面这样进行赋值
    // _openingBalance = f;
    
}

@end
