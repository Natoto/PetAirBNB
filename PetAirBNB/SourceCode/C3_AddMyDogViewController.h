//
//  C3_AddMyDogViewController.h
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface C3_AddMyDogViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableDictionary * dataDictionary;

-(void)datachange:(NSMutableArray *)imagearray
             name:(NSString *)name
              age:(NSString *)age
            month:(NSString *)month
        xinggedes:(NSString *)xinggedes
        pingzhong:(NSString *)pingzhong
          xingbie:(NSString *)xingbie
           tixing:(NSString *)tixing
            jieyu:(NSString *)jieyu
     yumaogongchu:(NSString *)yumaogongchu
           yimiao:(NSString *)yimiao;

@end
