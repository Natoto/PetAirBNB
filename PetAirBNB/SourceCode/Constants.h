//
//  Constants.h
//  DZ
//
//  Created by Nonato on 14-4-21.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#ifndef DZ_Constants_h
#define DZ_Constants_h
#endif


//#pragma mark -
//
//#if (BEE_TARGET_OS_IPHONE || BEE_TARGET_IPHONE_SIMULATOR)
//
//#define IOS8_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
//#define IOS7_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
//#define IOS6_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
//#define IOS5_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
//#define IOS4_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
//#define IOS3_OR_LATER		( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )
//
//#define IOS7_OR_EARLIER		( !IOS8_OR_LATER )
//#define IOS6_OR_EARLIER		( !IOS7_OR_LATER )
//#define IOS5_OR_EARLIER		( !IOS6_OR_LATER )
//#define IOS4_OR_EARLIER		( !IOS5_OR_LATER )
//#define IOS3_OR_EARLIER		( !IOS4_OR_LATER )
//
//#define IS_SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define IS_SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//
//#else	// #if (BEE_TARGET_OS_IPHONE || BEE_TARGET_IPHONE_SIMULATOR)
//
//#define IOS7_OR_LATER		(NO)
//#define IOS6_OR_LATER		(NO)
//#define IOS5_OR_LATER		(NO)
//#define IOS4_OR_LATER		(NO)
//#define IOS3_OR_LATER		(NO)
//
//#define IS_SCREEN_4_INCH	(NO)
//#define IS_SCREEN_35_INCH	(NO)
//
//#endif	// #if (BEE_TARGET_OS_IPHONE || BEE_TARGET_IPHONE_SIMULATOR)


//----------------------------------------------------------------- 颜色
#define KT_HEXCOLORA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define KT_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.8]
#define KT_UIColorWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KT_UIColorWithRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0f]
#define KT_UICOLOR_CLEAR [UIColor clearColor]
#define KT_DEFAULT_COLOR [UIColor whiteColor]   //默认颜色
#define KT_BlueColor    KT_HEXCOLOR(0x44B5FF)//
//---------------------------------------------------------------- 颜色


//----------------------------------------------------------------- 倒圆角
#define KT_CORNER_RADIUS(_OBJ,_RADIUS)   _OBJ.layer.masksToBounds = YES;\
_OBJ.layer.cornerRadius = _RADIUS;
#define KT_CORNER_RADIUS_VALUE_2    2.0f
#define KT_CORNER_RADIUS_VALUE_5    5.0f
#define KT_CORNER_RADIUS_VALUE_10   10.0f
#define KT_CORNER_RADIUS_VALUE_15   15.0f
#define KT_CORNER_RADIUS_VALUE_20   20.0f
//---------------------------------------------------------------- 倒圆角

//----------------------------------------------------------------- IOS版本
#define KT_IOS_VERSION_5_OR_ABOVE (([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 5)? (YES):(NO))
#define KT_IOS_VERSION_6_OR_ABOVE (([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 6)? (YES):(NO))
#define KT_IOS_VERSION_7_OR_ABOVE (([[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7)? (YES):(NO))
#define KT_DEVICE_IPHONE_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//---------------------------------------------------------------- IOS版本



//----------------------------------------------------------------- 文本对齐格式
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
#define KT_TextAlignmentLeft   NSTextAlignmentLeft
#define KT_TextAlignmentCenter NSTextAlignmentCenter
#define KT_TextAlignmentRight  NSTextAlignmentRight
#else
#define KT_TextAlignmentLeft   UITextAlignmentLeft
#define KT_TextAlignmentCenter UITextAlignmentCenter
#define KT_TextAlignmentRight  UITextAlignmentRight
#endif
//---------------------------------------------------------------- 文本对齐格式


//----------------------------------------------------------------- 文本Size
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define KT_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin)\
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero
#define KT_TEXTSIZE_SIMPLE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero

#else

#define KT_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero
#define KT_TEXTSIZE_SIMPLE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero
#endif
//---------------------------------------------------------------- 文本Size


//UIFont的属性宏
#define GB_DEFAULT_FONT(fontSize)      [UIFont fontWithName:@"FZZhongDengXian-Z07S" size:fontSize]  //方正中等线简体
#define GB_FontHelvetica_BoldNeue(fontSize)   [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]
#define GB_FontHelveticaNeue(fontSize)    [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize]

#define KT_LABELEWIFRAM(_OBJ, fm, txt, size, bgcolor, txtcolor, txtalignment, isbreak) \
    _OBJ.frame = fm;\
    _OBJ.text = txt;\
    _OBJ.font = GB_FontHelveticaNeue(size);\
    _OBJ.backgroundColor = bgcolor;\
    _OBJ.textColor = txtcolor;\
    _OBJ.textAlignment = txtalignment;\
    if(isbreak){\
    _OBJ.numberOfLines = 0;\
    _OBJ.lineBreakMode = NSLineBreakByWordWrapping;}

#define KT_CORNER_PROFILE(_OBJ) _OBJ.layer.masksToBounds = YES;\
[_OBJ.layer setCornerRadius:CGRectGetHeight([_OBJ bounds]) / 2];\
_OBJ.layer.borderWidth = 1;\
_OBJ.layer.borderColor = [[UIColor whiteColor] CGColor];


#define KT_IMGVIEW_CIRCLE(_OBJ,BDWITH) _OBJ.layer.masksToBounds = YES;\
[_OBJ.layer setCornerRadius:CGRectGetHeight([_OBJ bounds]) / 2];\
_OBJ.layer.borderWidth = BDWITH;\
_OBJ.layer.borderColor = [[UIColor whiteColor] CGColor];

#define KT_DATEFROMSTRING(string,confromTimespStr) NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;\
[formatter setDateStyle:NSDateFormatterMediumStyle];\
[formatter setTimeStyle:NSDateFormatterShortStyle];\
[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];\
NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[string integerValue]];\
confromTimespStr = [formatter stringFromDate:confromTimesp];

//--------------------------首页配置--------------------------------------
#define HOME_FID_TUIJIAN @"-1"
#define HOME_FID_NEWEST @"-3"
#define HOME_FID_HOTEST @"-4"
#define HOME_FID_DIGEST @"-6"
#define HOME_FID_MINE @"-2"
#define HOME_FID_ACTIVITY @"-8"
#define HOME_FID_ADD @"-7"
#define HOME_FID_GUANGGAO @"-5"

//--------------------------系统颜色--------------------------------------
//是否需要配置图片链接访问加密
#define IMAGEURLNEEDADDSECRET 0
#define kDuration 0.3

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

#undef	TAB_HEIGHT
#define TAB_HEIGHT	49.0f

#define SYS_AUTHORID @"authorid"
#define SYS_AUTHORNAME @"authorname"
#define SYS_AUTHORPASSWORD @"authorpassword"

#define CLR_DEFAULT    [UIColor whiteColor]
#define CLR_FOREGROUND [UIColor greenColor]
#define CLR_BACKGROUND [UIColor brownColor]
#define CLR_BUTTON_TXT [UIColor blueColor]
//[UIColor colorWithRed:20/255. green:154/255. blue:243/255. alpha:1]


/*!
 kHeightOfTopScrollView
 */
#define SLIDSWITCH_SECTIONS_HEIGHT 44.0f

#define LINE_LAYERBOARD_NOTCGCOLOR [UIColor colorWithWhite:0.8 alpha:1.0f]
#define LINE_LAYERBOARDCOLOR [UIColor colorWithWhite:0.8 alpha:1.0f].CGColor
#define LINE_LAYERBOARDWIDTH 0.5f


#define CLR_NEWMESSAGE [UIColor colorWithRed:221./255. green:153./255. blue:85./255 alpha:1]

#undef	FORUMCELLDIDADDHOMECOLOR
#define FORUMCELLDIDADDHOMECOLOR [UIColor colorWithRed:20/255. green:155/255. blue:242/255.  alpha:1] 

#define MODELOBJECTKEY(...)  [@[__VA_ARGS__] componentsJoinedByString:@"_"]


#undef	PER_PAGE
#define PER_PAGE	(20)

//---------------单例-----------------------
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#import <UIKit/UIKit.h>
