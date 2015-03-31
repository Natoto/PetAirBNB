//
//  UpdateProfileModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "pab.h"
#import "Bee_StreamViewModel.h"
#import "UpdateProfile.h"
typedef void(^UpdateProfileBlock)(UpdateProfile * block);
@interface UpdateProfileModel : BeeStreamViewModel

+(userupdateprofile *)userupdateprofilewithuserid:(NSString *)userid;

+(void)updateprofile:(NSString *)userid
            nickname:(NSString *)nickname
             country:(NSString *)country
            province:(NSString *)province
                city:(NSString *)city
            district:(NSString *)district
             address:(NSString *)address
     userdescription:(NSString *)userdescription
            progress:(ProgressBlock)progress
  updateprofileblock:(UpdateProfileBlock)updateprofileblock;
@end
