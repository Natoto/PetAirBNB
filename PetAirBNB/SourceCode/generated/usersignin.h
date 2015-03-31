//
//  usersignin.h
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bee.h"
#import "PetAirbnbPre.h"
#import "pab.h"

@interface usersignin : BeeActiveObject
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end


@interface user_signin : BeeActiveObject
@property (nonatomic, retain) usersignin *			usersignin;
@property (nonatomic, retain) Result *			Result;
@end



@interface REQ_USERSIGNIN_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *            userpasswordmd5;
@end


@interface LOGIN_SESSION : BeeActiveObject

@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpassword;
@end


@interface API_USERSIGNIN_SHOTS : BeeAPI
@property (nonatomic, retain) user_signin            *   resp;
@property (nonatomic, retain) REQ_USERSIGNIN_SHOTS  *   req;
@end



