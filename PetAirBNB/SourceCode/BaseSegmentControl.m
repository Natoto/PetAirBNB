//
//  BaseSegmentControl.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseSegmentControl.h"

@implementation BaseSegmentControl
-(void)willMoveToWindow:(UIWindow *)newWindow
{
    self.layer.cornerRadius = 15;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.layer setMasksToBounds:YES];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
