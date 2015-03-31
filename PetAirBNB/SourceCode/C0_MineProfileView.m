//
//  C0_MineProfileView.m
//  PetAirbnb
//
//  Created by nonato on 14-11-27.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C0_MineProfileView.h"
//#import "UIView+PanGesture.h"
@implementation C0_MineProfileView
DEF_SIGNAL(viewTap)

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    [self addGestureRecognizer:tap];
}

-(void)dataChange:(NSString *)imageurl
             name:(NSString *)name
          address:(NSString *)address
  profiletapblock:(void (^)())profiletapblock
     cellTapblock:(void (^)())celltapblock
{
    [self.Profile GET:imageurl useCache:YES];
    self.Name.text =[NSString stringWithFormat:@"%@",name];
    self.Address.text =[NSString stringWithFormat:@"%@",address];
    
    self.profiletapblock = profiletapblock;
    self.celltapblock = celltapblock;
}

-(void)viewTap:(id)sender
{
    if (self.celltapblock) {
        self.celltapblock();
    }
//    [self sendUISignal:self.viewTap];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
