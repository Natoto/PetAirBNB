//
//  C3_EditUserInfo_EditCell.h
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableViewCell.h"

@class C3_EditUserInfo_EditCell;
@protocol C3_EditUserInfo_EditCellDelegate<NSObject>


-(BOOL)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldShouldReturn:(UITextField *)textField;

@optional
-(BOOL)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell  textFieldDidBeginEditing:(UITextField *)textField;

-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell  textFieldDidEndEditing:(UITextField *)textField;

@end


@interface C3_EditUserInfo_EditCell : BaseTableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UITextField *txt_title;
@property (nonatomic,weak) id<C3_EditUserInfo_EditCellDelegate> txtfield_delegate;

@end
