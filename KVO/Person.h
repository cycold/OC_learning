//
//  Person.h
//  OC_learning
//
//  Created by icewater on 2/14/16.
//
//

#import <Foundation/Foundation.h>
#import "BankAccount.h"
//@class BankAccount;

@interface Person : NSObject

@property (nonatomic, strong) BankAccount *bankAccount;

// 注册打开监听银行账号的能力
- (void)registerAsObserver;

@end
