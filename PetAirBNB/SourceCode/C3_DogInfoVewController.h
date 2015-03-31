//
//  C3_DogInfoVewController.h
//  PetAirBNB
//
//  Created by nonato on 14-12-12.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface C3_DogInfoVewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong)NSMutableDictionary * dataDictionary;
@property(nonatomic,strong) NSString * petid;
@end
