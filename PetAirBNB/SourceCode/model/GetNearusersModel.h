//
//  GetNearusersModel.h
//  PetAirBNB
//
//  Created by nonato on 14-12-15.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "getnearusers.h"
#import "setlocation.h"

#define KEY_USERGETNEARUSERS @"usergetnearusers"
@interface GetNearusersModel : BeeStreamViewModel

+(NSArray *)getnearusers;
+(void)getnearusers:(NSString *)userid
          latitude:(NSString *)latitude
          longitude:(NSString *)longitude
          range:(NSString *)range
          progress:(ProgressBlock)progress
  getnearusersblock:(void(^)(getnearusers * getnearusersblock))getnearusersblock;


+(void)setlocation:(NSString *)userid
           latitude:(NSString *)latitude
          longitude:(NSString *)longitude
           progress:(ProgressBlock)progress
  setlocationblock:(void(^)(setlocation * setlocationblock))setlocationblock;

@end
