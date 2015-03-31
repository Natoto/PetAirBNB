//
//  Pet_UIConfig.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Pet_UIConfig.h"
#import "bee.h"
@implementation Pet_UIConfig

DEF_SINGLETON(Pet_UIConfig)

- (CGSize)baseOffset
{
    if ( IOS7_OR_LATER )
    {
        return CGSizeMake( 0.0f, 64.0f );
    }
    else
    {
        return CGSizeMake( 0.0f, 0.0f );
    }
}

-(UIEdgeInsets)separatorInset
{
    return UIEdgeInsetsMake( 0.0f, 0.0f, 0.0f, 0.0f );
}

//self.interfaceOrientation
- (UIEdgeInsets)VerbaseInsets
{
    if ( IOS7_OR_LATER )
    {
        return UIEdgeInsetsMake( 32.0f, 0.0f, 0.0f, 0.0f );
    }
    else
    {
        return UIEdgeInsetsMake( 0.0f, 0.0f, 0.0f, 0.0f );
    }
}


- (UIEdgeInsets)baseInsets
{
    if ( IOS7_OR_LATER )
    {
       return UIEdgeInsetsMake( 64.0f, 0.0f, 0.0f, 0.0f );
    }
    else
    {
        return UIEdgeInsetsMake( 0.0f, 0.0f, 0.0f, 0.0f );
    }
}

 
-(float)heightOfStatusBar
{
    if ( IOS7_OR_LATER )
    {
       return 0.0;
    }
    else
    {
        return  20;
    }
}
@end
