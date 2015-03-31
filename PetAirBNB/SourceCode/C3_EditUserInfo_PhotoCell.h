//
//  C3_EditUserInfo_PhotoCell.h
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableViewCell.h"

#define H_IMAGECELLHEIGHT 100.0
@interface C3_EditUserInfo_PhotoCell : BaseTableViewCell
@property(nonatomic,weak) IBOutlet UIScrollView  *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *addphoto;

-(void)noAddIcon:(BOOL)setnotaddIcon;

@end
