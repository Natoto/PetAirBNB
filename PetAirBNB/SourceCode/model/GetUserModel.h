//
//  GetUserModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "GetUser.h"
#import "Bee_StreamViewModel.h"
typedef void(^GetUserModelBlock)(GetUser * block);

@interface GetUserModel : BeeStreamViewModel
+(usergetuser *)usergetuserwithuserid:(NSString *)userid;

+(void)usergetprofile:(NSString *)userid
             progress:(ProgressBlock)progress
      usergetuserblock:(GetUserModelBlock)usergetuserblock;
@end
