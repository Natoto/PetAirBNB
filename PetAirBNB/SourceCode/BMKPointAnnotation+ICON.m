//
//  BMKPointAnnotation+(ICON).m
//  PetAirBNB
//
//  Created by nonato on 14-12-16.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BMKPointAnnotation+ICON.h"
#import <objc/runtime.h>
#define KEY_methodName @"BMKPointAnnotation.ICON"
@implementation BMKPointAnnotation(ICON)
@dynamic iconurl;
static char OperationKey;

-(void)setIconurl:(NSString *)iconurl
{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:iconurl forKey:KEY_methodName];
}

-(NSString * )iconurl
{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    
    if(opreations == nil) return nil;
     NSString * url = [opreations objectForKey:KEY_methodName];
    return url;
}
@end
