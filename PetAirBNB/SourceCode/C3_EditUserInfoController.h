//
//  C3_EditUserInfoController.h
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseViewController.h"
#import "UploadImageModel.h" 
 
@class BaseViewController;
@interface C3_EditUserInfoController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView * tableView;
@property(nonatomic,strong)NSMutableDictionary * dataDictionary;

@end
