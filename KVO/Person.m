//
//  Person.m
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _bankAccount = [[BankAccount alloc] init];
    }
    
    return self;
}

//OpeningBalance 为指向自己的指针, 指针里面放的是自己的地址
static void *OpeningBalance = (void *)&OpeningBalance;

- (void)registerAsObserver {
    // 监听银行账号的变化过程 self 监听 _bankAccount
    // options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld 表示监听新值和老的值,使用 | 分割
    // 给银行账号_bankAccount增加一个监听者: self
    // _bankAccount的属性openingBalance 只要有变化,就会触发回调
    [_bankAccount addObserver:self forKeyPath:@"openingBalance" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: OpeningBalance];
    // 最后的参数context也可以设置为NULL,context需要一个随机数,所以这里使用地址
}

// 设置移除监听方法
- (void)unregisterObserver {
    NSLog(@"移除监听器");
    [_bankAccount removeObserver:self forKeyPath:@"openingBalance"];
}

//监听回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath  // keyPath: 表示之前监听的key openingBalance
                      ofObject:(id)object           // object: 表示 _bankAccount
                        change:(NSDictionary<NSString *,id> *)change  // change 是一个字典, 包含了新,旧值
                       context:(void *)context      // context: 私有变量,表示 OpeningBalance
{
    NSLog(@"keyPath: %@, ofObject: %@, change: %@, context: %p", keyPath, object, change, context);
    if (context == OpeningBalance) {
    // 或者可以这么判断
    // if (keyPath isEqualToString:@"openingBalance") // 这种判读没有上面的指针判断性能好
        NSString *v = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"v is %@", v);
        
        // 监听改变后,立即移除
        // [self unregisterObserver];
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
