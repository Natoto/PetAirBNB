//
//  BaseTableViewController.h
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PetAirbnbPre.h"
#import "BaseTableViewCell.h"

#import "C0_MineTableViewConfiration.h"
@interface BaseTableViewController : UITableViewController
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(strong,nonatomic)C0_MineTableViewConfiration * config;

//上下拉要用到的
@property (nonatomic, assign) BOOL                       noFooterView;
@property (nonatomic, assign) BOOL                       noHeaderFreshView;

-(void)removeFooterView;
-(void)finishReloadingData;
-(void)setFooterView;
-(void)startHeaderLoading;

//调用上下拉需要的
-(void)refreshView;
-(void)getNextPageView;
-(void)FinishedLoadData;
@end
