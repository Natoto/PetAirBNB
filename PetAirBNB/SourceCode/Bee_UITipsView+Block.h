//
//  Bee_UITipsView+Block.h
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "Bee_UITipsView.h"
#import <objc/runtime.h>
@interface UIViewController(BeeUITipsViewBlock)
- (BeeUITipsView *)presentMessageTips:(NSString *)message dimissblock:(void(^)(id sender))block;
- (BeeUITipsView *)presentSuccessTips:(NSString *)message dimissblock:(void(^)(id sender))block;

- (BeeUITipsView *)presentFailureTips:(NSString *)message dimissblock:(void(^)(id sender))block;
- (BeeUITipsView *)presentSuccessTips:(NSString *)message inView:(UIView *)view dimissblock:(void(^)(id sender))block;
@end
