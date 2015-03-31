//
//  A1_NearListTableViewCell.h
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bee.h"
#import "BaseTableViewCell.h"
@interface A1_NearListTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dogname;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *distence;
@property (weak, nonatomic) IBOutlet BeeUIImageView *dogimage;
-(void)datachange:(NSString *)title price:(NSString *)price distence:(NSString *)distence imageurl:(NSString *)imageurl;
@end
