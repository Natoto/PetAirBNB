//
//  BaseTabBarController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-24.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tabBar setBarTintColor:CLR_BACKGROUND];
     [self.tabBar setTintColor:CLR_FOREGROUND];
    // Do any additional setup after loading the view.
    
    for (UITabBarItem * item in self.tabBar.items) {
        item.image = [[UIImage imageNamed:@"mine@2x.PNG"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]} forState:UIControlStateNormal];
        
        [item setTitleTextAttributes:@{UITextAttributeTextColor:CLR_FOREGROUND} forState:UIControlStateSelected];
    }
//    homeItem.image = [[UIImage imageNamed:@"tab_buddy_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    homeItem.selectedImage = [[UIImage imageNamed:@"tab_buddy_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
    
}
         
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
