//
//  usersignupModel.h
//  PetAirbnb
//
//  Created by BooB on 14-11-30.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "usersignup.h"

typedef void(^SignupBlock)(user_signup * block);
typedef void(^resultThreadBlock)(NSString * block);


@interface usersignupModel : BeeStreamViewModel 
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *            userpasswordmd5;
@property (nonatomic, retain) user_signup             * shots;

AS_SINGLETON(usersignupModel);

+(void)usersignupwith:(NSString *)usermail password:(NSString *)password progress:(ProgressBlock)progress signupblock:(SignupBlock)signupblock;

+(user_signup *)usersignupwithemail:(NSString *)email;


@end
