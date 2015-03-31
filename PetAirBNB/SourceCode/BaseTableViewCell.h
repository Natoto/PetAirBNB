//
//  BaseTableViewCell.h
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
@property(nonatomic,assign) BOOL RoundCircleType;
@property(nonatomic,strong) NSIndexPath * indexPath;
@property(nonatomic,assign) SEL selector;
@property(nonatomic,assign) id  delegate;



-(void)setcellProfile:(NSString *)title;
-(void)setcellTitle:(NSString *)title;
-(void)setcellTitleColor:(NSString *)color;
-(void)setcellValue:(NSString *)value;
-(void)setcellplaceholder:(NSString *)placeholder;
-(void)setcellArray:(NSMutableArray *)array;
-(void)setinputAccessoryView:(NSString *)inputAccessoryView;
-(void)setinputView:(NSString *)inputView;
//-(void)setcellAction:(SEL)action;
@end
