//
//  usersigninModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "pab.h"
#import "Bee_StreamViewModel.h"
#import "usersignin.h"

#define DEFAULT_USER @"default_user"

typedef void(^SignInBlock)(user_signin * block);

@interface usersigninModel : BeeStreamViewModel
AS_SINGLETON(usersigninModel)
@property (nonatomic, retain) LOGIN_SESSION         * session;
+(LOGIN_SESSION *)defaultUser;

+(usersignin *)usersigninwithemail:(NSString *)email;

+(void)usersignin:(NSString *)usermail password:(NSString *)password progress:(ProgressBlock)progress signinblock:(SignInBlock)signinblock;
@end
