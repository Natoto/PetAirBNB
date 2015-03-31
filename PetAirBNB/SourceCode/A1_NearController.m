//
//  A1_NearListController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-24.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "A1_NearController.h"
#import "A2_FilterViewController.h"
@interface A1_NearController ()
@property(nonatomic,assign) double  latitude;//纬度
@property(nonatomic,assign) double  longitude;//经度

@property (strong, nonatomic) IBOutlet UIScrollView *ContentView;
@property(nonatomic,strong) A2_FilterViewController * filterController;
@end

@implementation A1_NearController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.segmentControl setSelectedSegmentIndex:0];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"筛选" style:UIBarButtonItemStyleBordered target:self action:@selector(rightItemTap:)];
     self.navigationItem.rightBarButtonItem = rightItem;
  
    // Do any additional setup after loading the view.
}




-(A2_FilterViewController *)filterController
{
    if (!_filterController) {
        _filterController = [[A2_FilterViewController alloc] initWithNibName:@"A2_FilterViewController" bundle:nil];
    }
    return _filterController;
}
#pragma mark - 筛选
-(IBAction)rightItemTap:(id)sender
{
//    UINavigationController * navigation=[[UINavigationController alloc] initWithRootViewController:self.filterController];
    [self presentViewController:self.filterController animated:YES completion:^{        
//        [navigation.navigationBar setBarTintColor:CLR_BACKGROUND];
//        [[UINavigationBar appearance] setTintColor:CLR_FOREGROUND];
//        [navigation.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]}];
    }];
}


-(A1_NearListController *)nearlistController
{
    if (!_nearlistController) {
        _nearlistController = [[A1_NearListController alloc] initWithNibName:@"A1_NearListController" bundle:nil];
        [self.ContentView addSubview:_nearlistController.view];
        
    }
    return _nearlistController;
}
-(UIScrollView *)ContentView
{
    if (!_ContentView) {
        _ContentView = [[UIScrollView alloc] init];
        _ContentView.scrollEnabled = NO;
        _ContentView.showsHorizontalScrollIndicator = NO;
        _ContentView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_ContentView];
    }
    return _ContentView;
}


-(void)viewWillLayoutSubviews
{
    [self BuildUI];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}
-(void)BuildUI
{
    //[Pet_UIConfig sharedInstance].baseInsets.top
    if (self.interfaceOrientation == 1) {
         self.ContentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }
    else
    {
         self.ContentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }
    CGRect frame = self.ContentView.frame;
    if (self.ContentView) {
        if (self.mapController && self.nearlistController)
        {
            self.nearlistController.view.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
            self.mapController.view.frame = CGRectMake(CGRectGetWidth(frame), 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
            [self.ContentView setContentSize:CGSizeMake(CGRectGetWidth(frame)*2, CGRectGetHeight(frame))];
        }
    }
    [self segmentControlSelect:_segmentControl];
}

-(A1_MapViewController *)mapController
{
    if (!_mapController) {
        _mapController = [[A1_MapViewController alloc] initWithNibName:@"A1_MapViewController" bundle:nil];
        [self.ContentView addSubview:_mapController.view];
    }
    return _mapController;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)segmentControlSelect:(id)sender
{
    CGRect frame = self.ContentView.frame; //[UIScreen mainScreen].bounds;
    if (self.segmentControl.selectedSegmentIndex == 0) {
        [self.ContentView setContentOffset:CGPointMake(0, 0)];
    }
    else
    {
        [self.ContentView setContentOffset:CGPointMake(CGRectGetWidth(frame), 0)];
          
    }
    
}
@end
