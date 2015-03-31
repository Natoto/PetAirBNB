//
//  ToolsFunc.h
//  DZ
//
//  Created by Nonato on 14-6-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "DZ_SystemSetting.h"
#import <Foundation/Foundation.h>
#import "Bee.h"
#import "UIImage+Tint.h"
#import "Bee_UIImageView.h"
#define TL_PUSTMAK(device) @"" 

//去掉perform的警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


//[NSString stringWithFormat:@"\n※※ 发布于: %@客户端 ※※",device]

@interface ToolsFunc : NSObject
AS_SINGLETON(ToolsFunc)
+(NSString *)datefromstring:(NSString *)timestr;
+(NSString *)datefromstring2:(NSString *)timestr;

+ (BeeUIImageView *)LoadImageViewWithFrame:(CGRect)frame andImgName:(NSString *)imgurl tag:(int)tag superview:(UIView *)superview;
+(BeeUIImageView *)CreateImageViewWithFrame:(CGRect)frame andImgName:(NSString *)imgname;


+(UILabel *)CreateLabelWithFrame:(CGRect)frame andTxt:(NSString *)TXT;
+ (BeeUILabel *)CreateBeeLabelWithFrame:(CGRect)frame andTxt:(NSString *)TXT;
+ (UILabel *)CreateLabelWithFrame:(CGRect)frame andTxt:(NSString *)TXT fontsize:(NSUInteger)size;
+(UIButton *)CreateButtonWithFrame:(CGRect)frame andTxt:(NSString *)TXT txtcolor:(UIColor *)color;
+ (UIButton *)CreateButtonWithFrame:(CGRect)frame andimage:(NSString *)imagename;
+(UIButton *)CreateButtonWithFrame:(CGRect)frame andTxt:(NSString *)TXT;
+(SEL)hbselector:(SEL)oldselector target:(id)target firstArgument:(id)firstArgument , ...;

+(BOOL)isSelfWebSite:(NSString *)url;
+ (NSString *)articletid:(NSString *)url;
+(NSString *)websiteArticleUrl:(NSString *)tid;
//跟设备相关的
+ (NSString*)deviceType;


-(float)imageSizewithUrl:(NSString *)url;
@end
