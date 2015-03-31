//
//  C3_EditUserInfo_PhotoCell.m
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C3_EditUserInfo_PhotoCell.h"
#import "ToolsFunc.h"
#import "UIView+FLKAutoLayout.h"
#define TAG_IMAGESTART 120115
@interface C3_EditUserInfo_PhotoCell()
@property(nonatomic,assign) NSUInteger     imagesCount;
@end

@implementation C3_EditUserInfo_PhotoCell

-(void)noAddIcon:(BOOL)setnotaddIcon
{
    self.addphoto.hidden = setnotaddIcon;
    
    [self removeConstraints:self.constraints];
    if (setnotaddIcon) {//隐藏添加图片按钮
        
        [self.scrollview  alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.contentView];
    }
    else//显示添加图片按钮
    {
        [self.addphoto alignLeadingEdgeWithView:self.contentView predicate:@"10"];
        [self.addphoto  alignTopEdgeWithView:self.contentView predicate:nil];
        [self.addphoto alignBottomEdgeWithView:self.contentView predicate:nil];
        
        [self.addphoto constrainWidth:@"==80" height:@">=40"];
        
        [self.scrollview alignTrailingEdgeWithView:self.contentView predicate:nil];
        [self.scrollview alignTopEdgeWithView:self.contentView predicate:nil];
        [self.scrollview alignBottomEdgeWithView:self.contentView predicate:nil];
        
        [self.scrollview constrainLeadingSpaceToView:self.addphoto predicate:nil];
        
        
    }
}
-(void)willMoveToWindow:(UIWindow *)newWindow
{
    UITapGestureRecognizer * tapgesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addPhotos:)];
    [_scrollview addGestureRecognizer:tapgesture];
    
}


-(IBAction)addPhotos:(id)sender
{
    if(self.delegate && self.selector)
        SuppressPerformSelectorLeakWarning([self.delegate performSelector:self.selector withObject:sender]);
}

-(void)setcellArray:(NSMutableArray *)array
{
    NSArray * imageArray = array;
    float F_IMAGEWIDTH = 60.0;
    float F_IMGSPLIT = 5;
    float F_IMAGE_Y = (H_IMAGECELLHEIGHT - 20 - F_IMAGEWIDTH)/2;
    for (NSInteger index = 0; index < imageArray.count; index ++) {
        CGRect rect = CGRectMake(index * (F_IMAGEWIDTH + F_IMGSPLIT) , F_IMAGE_Y, F_IMAGEWIDTH, F_IMAGEWIDTH);
        NSString * imageurl = [imageArray objectAtIndex:index];
        [ToolsFunc  LoadImageViewWithFrame:rect andImgName:imageurl tag:TAG_IMAGESTART + index superview:self.scrollview];
        if ((index +1) * (F_IMAGEWIDTH + F_IMGSPLIT) > CGRectGetWidth(_scrollview.frame)) {
            _scrollview.contentSize = CGSizeMake((index +1) * (F_IMAGEWIDTH + F_IMGSPLIT), F_IMAGEWIDTH);
        }
    }
    [self reloadSubViews:imageArray];
}

-(void)reloadSubViews:(NSArray *)imgary
{
    if ( self.imagesCount > imgary.count) {
        for (NSInteger index = imgary.count; index < self.imagesCount; index ++) {
            UIImageView * imgview = (UIImageView *)[self.scrollview viewWithTag:TAG_IMAGESTART + index];
            if (imgview) {
                [imgview removeFromSuperview];
            }
        }
    }
    self.imagesCount = imgary.count;
}


-(void)setcellTitle:(NSString *)title
{
    if (title.length) {
        [self.addphoto setTitle:title forState:UIControlStateNormal];
        [self noAddIcon:NO];
    }
    else
    {
        [self noAddIcon:YES];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
