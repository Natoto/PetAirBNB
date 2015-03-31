//
//  A1_NearListController.h
//  PetAirbnb
//
//  Created by nonato on 14-11-24.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetAirbnbPre.h"
#import "A1_NearListController.h"
#import "A1_MapViewController.h"
@interface A1_NearController : BaseViewController
@property(nonatomic,strong) IBOutlet UISegmentedControl * segmentControl;
     
@property(nonatomic,strong) A1_MapViewController * mapController;
@property(nonatomic,strong) A1_NearListController * nearlistController;
@end
