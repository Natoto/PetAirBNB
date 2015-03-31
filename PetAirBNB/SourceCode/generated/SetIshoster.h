//
//  SetIshoster.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pab.h"

@class usersetishoster;
@interface SetIshoster : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersetishoster *			usersetishoster;
@end

@interface usersetishoster : BeeActiveObject
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *            userpasswordmd5;
@property (nonatomic, retain) NSString *			ishoster;
@end


@interface REQ_SETISHOSTER_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, assign) BOOL                  ishoster;
@end

//usersignin

@interface API_SETISHOSTER_SHOTS : BeeAPI
@property (nonatomic, retain) SetIshoster            *   resp;
@property (nonatomic, retain) REQ_SETISHOSTER_SHOTS  *   req;
@end
