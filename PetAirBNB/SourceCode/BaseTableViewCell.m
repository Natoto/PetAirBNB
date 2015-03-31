//
//  BaseTableViewCell.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableViewCell.h"
@interface BaseTableViewCell()

@end
@implementation BaseTableViewCell
 
- (void)awakeFromNib {
    // Initialization code
}
           
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    if (self.RoundCircleType) {
        if (_indexPath.row) {
            
        }
    }
} 
-(void)setcellProfile:(NSString *)title{}
-(void)setcellTitle:(NSString *)title{}
-(void)setcellTitleColor:(NSString *)color{}
-(void)setcellValue:(NSString *)value{}
-(void)setcellArray:(NSMutableArray *)array{}
-(void)setcellplaceholder:(NSString *)placeholder{}
-(void)setcellAction:(SEL)action{}
-(void)setinputAccessoryView:(NSString *)inputAccessoryView{}
-(void)setinputView:(NSString *)inputView{}
@end
