//
//  BaseViewController.h
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetAirbnbPre.h"


#define KEY_INDEXPATH(SECTION,ROW) [NSString stringWithFormat:@"section%u_%u",SECTION,ROW]
#define KEY_SECTION(SECTION) [NSString stringWithFormat:@"section%d",SECTION]

@interface CELL_STRUCT : NSObject

@property(nonatomic,assign) CGFloat     cellheight;
@property(nonatomic,assign) SEL         sel_selector;
@property(nonatomic,strong) NSString  * key_indexpath;
@property(nonatomic,strong) NSString  * cellclass;
@property(nonatomic,strong) NSString  * sectiontitle;
@property(nonatomic,assign) CGFloat     sectionheight;
@property(nonatomic,strong) NSString  * title;
@property(nonatomic,strong) NSString  * value;
@property(nonatomic,strong) NSString  * subvalue1;
@property(nonatomic,strong) NSString  * subvalue2;
@property(nonatomic,strong) NSString  * placeHolder;
@property(nonatomic,strong) NSString  * titlecolor;
@property(nonatomic,strong) NSString  * cellctr;
@property(nonatomic,strong) NSString  * picture;
@property(nonatomic,strong) NSString  * rightComponts;
@property(nonatomic,strong) NSString  * rightValue;
@property(nonatomic,assign) BOOL        accessory;
@property(nonatomic,assign) BOOL        selectionStyle;
@property(nonatomic,strong) NSMutableArray * array;
@property(nonatomic,strong) NSMutableArray * uploadobjcts;
@property(nonatomic,assign) NSInteger       uploadingIndex;
@property(nonatomic,assign) id              delegate;
@property(nonatomic,strong) id              object;
@property(nonatomic,strong) NSString    * inputAccessoryView;
@property(nonatomic,strong) NSString    * inputView;

-(id)initWithtitle:(NSString *)title cellclass:(NSString *)cellclass placeholder:(NSString *)placehoder accessory:(BOOL)accessory sel_selctor:(SEL)selector delegate:(id)delegate;
@end


@interface BaseViewController : UIViewController

- (void)keyBoardWillShow:(NSNotification *)notify;
- (void)keyBoardWillHide:(NSNotification *)notify;
@end
