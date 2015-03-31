//
//  C0_MineProfileView.h
//  PetAirbnb
//
//  Created by nonato on 14-11-27.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetAirbnbPre.h"

typedef void(^PROFILETAPBLOCK)(void);
typedef void(^CELLTAPBLOCK)(void);

@interface C0_MineProfileView : UIView
@property (weak, nonatomic) IBOutlet BeeUIImageView *Profile;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Address;
//AS_SIGNAL(viewTap)

@property(nonatomic,copy)PROFILETAPBLOCK  profiletapblock;
@property(nonatomic,copy)CELLTAPBLOCK     celltapblock;
-(void)dataChange:(NSString *)imageurl name:(NSString *)name address:(NSString *)address profiletapblock:(void(^)())profiletapblock cellTapblock:(void(^)())celltapblock;

@end
