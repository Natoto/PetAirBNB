//
//  B4_PreviewImageView+NetWork.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "B4_PreviewImageView.h"

@interface B4_PreviewImageView(NetWork)<UIActionSheetDelegate>

//-(id)initWithFrame:(CGRect)frame withurl:(NSString *)url target:(id)target andSEL:(SEL)selaction contentAry:(NSArray *)contentAry deleteblock:(void(^)(NSInteger block))index;

-(void)showInView:(UIView *)superview currenturl:(NSString *)url index:(NSInteger )index urls:(NSArray *)urls shownblock:(PREVIEWSHOWN)showblock tappedblock:(PREVIEWTAPPEDBLOCK)tappedblock  deleteblock:(void(^)(NSInteger block))deleteindex;
@end
