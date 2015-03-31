//
//  Bee_UITipsView+Block.m
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_UITipsView+Block.h"
#define KEY_OBJECT_DISMISSBLOCKER @"NSObject.BeeUITipsView.Blocker"
#define KEY_methodName @"dismissblock"

@implementation UIViewController(BeeUITipsViewBlock)
static char OperationKey;

- (BeeUITipsView *)presentMessageTips:(NSString *)message dimissblock:(void (^)(id))block
{
    UIView * container = nil;
    
    if ( [self isKindOfClass:[UIView class]] )
    {
        container = (UIView *)self;
    }
    else if ( [self isKindOfClass:[UIViewController class]] )
    {
        container = ((UIViewController *)self).view;
    }
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:KEY_methodName];
    
    return [[BeeUITipsCenter sharedInstance] presentMessageTips:message inView:container];
}

ON_SIGNAL3(BeeUITipsView, WILL_DISAPPEAR, signal)
{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil) return;
    void(^block)(id sender) = [opreations objectForKey:KEY_methodName];
    
    if (block)
        block(self);
    
}

- (BeeUITipsView *)presentSuccessTips:(NSString *)message dimissblock:(void (^)(id))block
{
    UIView * container = nil;
    
    if ( [self isKindOfClass:[UIView class]] )
    {
        container = (UIView *)self;
    }
    else if ( [self isKindOfClass:[UIViewController class]] )
    {
        container = ((UIViewController *)self).view;
    }
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:KEY_methodName];
    
    
    return [[BeeUITipsCenter sharedInstance] presentSuccessTips:message inView:container];
}
//
- (BeeUITipsView *)presentFailureTips:(NSString *)message dimissblock:(void (^)(id))block
{
    UIView * container = nil;
    
    if ( [self isKindOfClass:[UIView class]] )
    {
        container = (UIView *)self;
    }
    else if ( [self isKindOfClass:[UIViewController class]] )
    {
        container = ((UIViewController *)self).view;
    }
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:KEY_methodName];
    
    return [[BeeUITipsCenter sharedInstance] presentFailureTips:message inView:container];
} 
//
- (BeeUITipsView *)presentSuccessTips:(NSString *)message inView:(UIView *)view dimissblock:(void (^)(id))block
{
    UIView * container = nil;
    
    if ( [self isKindOfClass:[UIView class]] )
    {
        container = (UIView *)self;
    }
    else if ( [self isKindOfClass:[UIViewController class]] )
    {
        container = ((UIViewController *)self).view;
    }
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:block forKey:KEY_methodName];
    
    return [[BeeUITipsCenter sharedInstance] presentSuccessTips:message inView:container];
}


@end
