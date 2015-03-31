//
//  C3_DogInfoTxtCell.m
//  PetAirBNB
//
//  Created by nonato on 14-12-12.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C3_DogInfoTxtCell.h"

@implementation C3_DogInfoTxtCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setcellTitle:(NSString *)title
{
    self.titlelbl.text = [NSString stringWithFormat:@"%@",title];
}

-(void)setcellValue:(NSString *)value
{
    self.valuelbl.text = [NSString stringWithFormat:@"%@",value];
}

@end
