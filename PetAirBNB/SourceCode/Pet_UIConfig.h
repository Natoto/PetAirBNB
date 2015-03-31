//
//  Pet_UIConfig.h
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@interface Pet_UIConfig : NSObject
AS_SINGLETON(Pet_UIConfig)

- (CGSize)baseOffset;
-(UIEdgeInsets)separatorInset;
- (UIEdgeInsets)baseInsets;
-(float)heightOfStatusBar;
- (UIEdgeInsets)VerbaseInsets;
@end
