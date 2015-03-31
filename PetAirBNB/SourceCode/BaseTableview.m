//
//  BaseTableview.m
//  PetAirBNB
//
//  Created by nonato on 14-12-12.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableview.h"

@implementation BaseTableview

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    //拖拽的时候隐藏键盘
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
