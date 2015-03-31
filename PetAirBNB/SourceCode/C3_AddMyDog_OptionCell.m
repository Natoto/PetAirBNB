//
//  C3_AddMyDog_OptionCell.m
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C3_AddMyDog_OptionCell.h"
#define TAG_ADDOPTION_BTN_START 1218

@implementation C3_AddMyDog_OptionCell

- (void)awakeFromNib {
    // Initialization code
    
//    self.optionicon1.tag = TAG_ADDOPTION_BTN_START;
//    self.optionvalue1.tag = TAG_ADDOPTION_BTN_START + 1;
//    
//    self.optionicon2.tag = TAG_ADDOPTION_BTN_START + 2;
//    self.optionvalue2.tag = TAG_ADDOPTION_BTN_START + 3;
//    
//    self.optionicon3.tag = TAG_ADDOPTION_BTN_START + 4;
//    self.optionvalue3.tag = TAG_ADDOPTION_BTN_START + 5;
    
    [self setSelectCheck:TAG_ADDOPTION_BTN_START];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)buttonTap:(id)sender
{
    UIButton * button = (UIButton *)sender;
    NSLog(@"tapped button tag = %d ",button.tag);
    NSInteger currentTag = button.tag;
    [self setSelectCheck:currentTag];
}


-(void)setSelectCheck:(NSInteger)currentTag
{
    switch (currentTag) {
        case TAG_ADDOPTION_BTN_START | (TAG_ADDOPTION_BTN_START + 1):
            currentTag = TAG_ADDOPTION_BTN_START;
            break;
        case (TAG_ADDOPTION_BTN_START + 2) | (TAG_ADDOPTION_BTN_START + 3):
            currentTag = TAG_ADDOPTION_BTN_START + 2;
            break;
        case (TAG_ADDOPTION_BTN_START + 4) | (TAG_ADDOPTION_BTN_START + 5):
            currentTag = TAG_ADDOPTION_BTN_START + 4;
            break;
        default:
            break;
    }
    
    for(NSInteger indextag = TAG_ADDOPTION_BTN_START ; indextag <= TAG_ADDOPTION_BTN_START + 4; indextag = indextag + 2)
    {
        UIButton * tempbtn = (UIButton *)[self.contentView viewWithTag:indextag];
        if(!tempbtn) continue;
        if (indextag == currentTag) {
            UIImage * image = [UIImage imageNamed:@"checked.jpg"];
            [tempbtn setImage:image forState:UIControlStateNormal];
        }
        else
        {
            UIImage * image = [UIImage imageNamed:@"uncheck.jpg"];
            [tempbtn setImage:image forState:UIControlStateNormal];
        }
    }
}
//传值1 2 3 过来
-(void)setValue:(id)value forKey:(NSString *)key
{
    NSInteger indextag = 0;
    if ([[value class] isSubclassOfClass:[NSString class]]) {
        NSString * valuestr = (NSString *)value;
        indextag =valuestr.integerValue;
    }
    switch (indextag) {
        case 0:
            indextag = TAG_ADDOPTION_BTN_START;
            break;
        case 1:
            indextag = TAG_ADDOPTION_BTN_START + 2;
            break;
        case 2:
            indextag = TAG_ADDOPTION_BTN_START + 4;
            break;
        default:
            break;
    }
    [self setSelectCheck:indextag];
}

-(UIButton *)buttonWithIndexTag:(NSInteger)index
{
    NSInteger indextag = TAG_ADDOPTION_BTN_START + index;
    UIButton * tempbtn = (UIButton *)[self.contentView viewWithTag:indextag];
    return tempbtn;
}
-(void)setcellArray:(NSMutableArray *)array
{
    self.optionvalue3 = [self buttonWithIndexTag:5];
    self.optionicon3 = [self buttonWithIndexTag:4];
    self.optionvalue1 = [self buttonWithIndexTag:1];
    self.optionvalue2 = [self buttonWithIndexTag:3];
    if (array.count == 3) {
        self.optionvalue3.hidden = NO;
        self.optionicon3.hidden = NO;
        
        NSString *value1 = [array objectAtIndex:0];
        NSString *value2 = [array objectAtIndex:1];
        NSString *value3 = [array objectAtIndex:2];
        
        [self.optionvalue1 setTitle:value1 forState:UIControlStateNormal];
        [self.optionvalue1 sizeToFit];
        [self.optionvalue2 setTitle:value2 forState:UIControlStateNormal];
        [self.optionvalue3 setTitle:value3 forState:UIControlStateNormal];
        
    }
    else if (array.count == 2)
    {
        self.optionvalue3.hidden = YES;
        self.optionicon3.hidden = YES;
        
        NSString *value1 = [array objectAtIndex:0];
        NSString *value2 = [array objectAtIndex:1];
        
        [self.optionvalue1 setTitle:value1 forState:UIControlStateNormal];
        [self.optionvalue1 sizeToFit];
        
        [self.optionvalue2 setTitle:value2 forState:UIControlStateNormal];
    }
}
@end
