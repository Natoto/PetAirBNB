//
//  BaseViewController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+TapGesture.h"

@implementation CELL_STRUCT
-(id)initWithtitle:(NSString *)title cellclass:(NSString *)cellclass placeholder:(NSString *)placehoder accessory:(BOOL)accessory sel_selctor:(SEL)selector delegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.uploadingIndex = 0;
        self.selectionStyle = YES;
        self.uploadobjcts = [[NSMutableArray alloc] initWithCapacity:0];
        self.array = [[NSMutableArray alloc] initWithCapacity:0];
        self.cellheight = 50.0;
        self.titlecolor = @"black";
        self.title = title;
        self.cellclass = cellclass;
        self.placeHolder = placehoder;
        self.accessory = accessory;
        self.sel_selector = selector;
        self.delegate = delegate;
    }
    return self;
}

@end



@implementation BaseViewController
 
-(void)loadView
{
    //	INFO( @"'%@' loadView", [[self class] description] );
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
//        if ( [BeeUIConfig sharedInstance].iOS6Mode )
//        {
//            self.edgesForExtendedLayout = UIRectEdgeNone;
//            self.extendedLayoutIncludesOpaqueBars = NO;
//            self.modalPresentationCapturesStatusBarAppearance = NO;
//        }
//        else
//        {//如果改为 UIRectEdgeAll 则整个界面会上移 //;//
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = YES;
            self.modalPresentationCapturesStatusBarAppearance = YES;
//        }
    }
#endif	// #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    
    if ( self.nibName )
    {
        [super loadView];
        //            self.view.signalReceiver = self;
    }
    else
    {
        self.view = [[UIView alloc] initWithFrame:CGRectZero];
        self.view.backgroundColor = [UIColor clearColor];
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        CGRect frame = [UIScreen mainScreen].bounds;
        self.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
    
    
}



-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //push的时候隐藏tabbar        
        self.hidesBottomBarWhenPushed = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        self.view.tapEnabled = YES;
         
    }
    return self;
}

#pragma mark - 响应键盘事件
- (void)keyBoardWillShow:(NSNotification *)notify
{
    
}
- (void)keyBoardWillHide:(NSNotification *)notify
{
    
}

ON_SIGNAL3(UIView, TAPPED, signal)
{
    NSArray *subviews = self.view.subviews;
    for (UIView *item in subviews) {
        if ([[item class] isSubclassOfClass:[UITextField class]]) {
            [item resignFirstResponder];
        }
    }
}

-(void)dealloc
{
    [self unobserveAllNotifications];
}


@end
