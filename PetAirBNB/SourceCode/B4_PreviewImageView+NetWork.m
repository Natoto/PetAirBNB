//
//  B4_PreviewImageView+NetWork.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "B4_PreviewImageView+NetWork.h"
#import "DeleteImageModel.h"
#import "usersigninModel.h"

#define KEY_DELETEIMAGEMETHOD @"deleteimageblock"

@implementation B4_PreviewImageView(NetWork)
static char OperationKey;

-(void)showInView:(UIView *)superview currenturl:(NSString *)url index:(NSInteger)index urls:(NSArray *)urls shownblock:(PREVIEWSHOWN)showblock tappedblock:(PREVIEWTAPPEDBLOCK)tappedblock deleteblock:(void (^)(NSInteger))deleteindex
{
    
    [self  showInView:superview currenturl:url index:index urls:urls shownblock:showblock tappedblock:tappedblock];
    if (self.actionSheet) {
        self.actionSheet.delegate = self;
    }
    
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:deleteindex forKey:KEY_DELETEIMAGEMETHOD];
    
//    [self.deleteButton addTarget:self action:@selector(deleteBtnTap:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview) {
        
    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BeeLog(@"clicked Button Index%d",buttonIndex);
    switch (buttonIndex) {
        case 1://压缩图片
        {
            break;
        }
        case 0://删除图片
        {
            NSUInteger index = [self currentImageViewIndex];
            if (self.imgURLarray.count) {
                NSString * imageurl =[self.imgURLarray objectAtIndex:index];
                [DeleteImageModel deleteimage:[usersigninModel sharedInstance].session.userid
                                     imageurl:imageurl
                                     progress:^(REQUEST_TYPE progress) {
                                         if (progress == RELOADING) {
                                             [self presentLoadingTips:@"删除中..."];
                                         }
                                         else if(progress == FAILED)
                                         {
                                             [self dismissTips];
                                         }
                                     }
                             deleteimageblock:^(DeleteImage *deleteimageblock) {
                                 if (deleteimageblock.userdeleteimage.userid)
                                 {
                                     [self deleteButtonTap:nil];
                                     [[BeeImageCache sharedInstance] deleteImageForURL:imageurl];
                                     [self loadSubViews:self.imgURLarray imgindex:index];
                                     [self dismissTips];
                                     
                                      NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
                                     if(opreations == nil) return;
                                     void(^block)(NSInteger sender) = [opreations objectForKey:KEY_DELETEIMAGEMETHOD];
                                     
                                     if (block)
                                         block(index);
                                     if (self.imgURLarray.count) {
                                         [self presentSuccessTips:@"删除成功!"];
                                     }
                                 }
                             }];
            } 
            break;
        }
        default:
            break;
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
