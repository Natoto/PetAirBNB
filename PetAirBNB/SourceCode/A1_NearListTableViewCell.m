//
//  A1_NearListTableViewCell.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "A1_NearListTableViewCell.h"
#import "PetAirbnbPre.h"
@implementation A1_NearListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
-(void)datachange:(NSString *)title price:(NSString *)price distence:(NSString *)distence imageurl:(NSString *)imageurl
{
    self.dogname.text = [NSString stringWithFormat:@"%@",title];
    self.price.text = [NSString stringWithFormat:@"%@ 元/天",price];
    self.distence.text = [NSString stringWithFormat:@"%@ km",distence];
    [self.dogimage GET:imageurl useCache:YES];
//    KT_CORNER_PROFILE(self.dogimage);
}
@end
