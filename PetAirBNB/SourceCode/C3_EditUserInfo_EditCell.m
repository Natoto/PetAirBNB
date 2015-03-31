//
//  C3_EditUserInfo_EditCell.m
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "HZAreaPickerView.h"
#import "C3_EditUserInfo_EditCell.h"
@interface C3_EditUserInfo_EditCell()<HZAreaPickerDelegate>
@property(nonatomic,strong) HZAreaPickerView * locatePicker;
@end

@implementation C3_EditUserInfo_EditCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(HZAreaPickerView *)locatePicker
{
    if (!_locatePicker) {
        _locatePicker = [[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCityAndDistrict delegate:self];
    }
    return _locatePicker;
    
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview) {
        self.txt_title.delegate = self;
        self.txtfield_delegate = self.delegate;
    }
}
#pragma mark - HZAreaPickerView delegate
-(void)setinputView:(NSString *)inputView
{
    if (inputView) {
        if ([inputView isEqualToString:@"HZAreaPickerView"]) {
            self.txt_title.inputView  = self.locatePicker;
        }
    }
}

-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker
{
     self.txt_title.text = [NSString stringWithFormat:@"%@ %@ %@", picker.locate.state, picker.locate.city, picker.locate.district];
    
    if (self.txtfield_delegate && [self.txtfield_delegate respondsToSelector:@selector(C3_EditUserInfo_EditCell:textField:shouldChangeCharactersInRange:replacementString:)]) {
        [self.txtfield_delegate C3_EditUserInfo_EditCell:self textField:self.txt_title shouldChangeCharactersInRange:NSMakeRange(0, 1) replacementString:self.txt_title.text];
    }
    
}

-(void)setcellTitle:(NSString *)title
{
    self.lbl_title.text = title;
}

-(void)setcellValue:(NSString *)value
{
    self.txt_title.text = value;
}

-(void)setcellplaceholder:(NSString *)placeholder
{
    self.txt_title.placeholder = placeholder;
}

#pragma mark  - textfield delegate

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)canResignFirstResponder
{
    return YES;
}

-(BOOL)becomeFirstResponder
{
   return [self.txt_title becomeFirstResponder];
}

-(BOOL)resignFirstResponder
{
   return [self.txt_title resignFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.txtfield_delegate && [self.txtfield_delegate respondsToSelector:@selector(C3_EditUserInfo_EditCell:textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.txtfield_delegate C3_EditUserInfo_EditCell:self textField:self.txt_title shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.txtfield_delegate && [self.txtfield_delegate respondsToSelector:@selector(C3_EditUserInfo_EditCell:textFieldDidBeginEditing:)]) {
        [self.txtfield_delegate C3_EditUserInfo_EditCell:self textFieldDidBeginEditing:self.txt_title];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.txtfield_delegate && [self.txtfield_delegate respondsToSelector:@selector(C3_EditUserInfo_EditCell:textFieldDidEndEditing:)]) {
        [self.txtfield_delegate C3_EditUserInfo_EditCell:self textFieldDidEndEditing:self.txt_title];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.txtfield_delegate && [self.txtfield_delegate respondsToSelector:@selector(C3_EditUserInfo_EditCell:textFieldShouldReturn:)]) {
        return [self.txtfield_delegate C3_EditUserInfo_EditCell:self textFieldShouldReturn:textField];
    }
    return YES;
}

@end
