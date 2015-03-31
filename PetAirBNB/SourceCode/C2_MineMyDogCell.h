//
//  C2_MineMyDogCell.h
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bee.h"
#import "BaseTableViewCell.h"
@interface C2_MineMyDogCell : BaseTableViewCell
@property(nonatomic,weak) IBOutlet BeeUIImageView * profile;
@property(nonatomic,weak) IBOutlet UILabel * name;

@end
