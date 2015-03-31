//
//  C2_MineMyDogCell.m
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C2_MineMyDogCell.h"

@implementation C2_MineMyDogCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setcellValue:(NSString *)value
{
    
}

-(void)setcellTitleColor:(NSString *)color
{
    if ([color isEqualToString:@"gray"]) {
        [self.name setTextColor:[UIColor grayColor]];
    }
}
-(void)setcellTitle:(NSString *)title
{
    if (!title) {
        title = @"";
    }
    self.name.text = [NSString stringWithFormat:@"%@",title];
}
@end
