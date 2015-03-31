//
//  GetProfileModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "GetProfile.h"
#import "Bee_StreamViewModel.h"
 

typedef void(^GetProfileModelBlock)(GetProfile * block);

@interface GetProfileModel : BeeStreamViewModel
+(usergetprofile *)usergetprofilewithuserid:(NSString *)userid;

+(void)usergetprofile:(NSString *)userid
             progress:(ProgressBlock)progress
  getprofileblock:(GetProfileModelBlock)getprofileblock;
@end
