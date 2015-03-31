//
//  C0_MineCell.h
//  PetAirbnb
//
//  Created by nonato on 14-11-27.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"
@interface C0_MineCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;
@property (weak, nonatomic) IBOutlet UISwitch *onoffswitch;

@end
