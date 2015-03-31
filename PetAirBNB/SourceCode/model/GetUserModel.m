//
//  GetUserModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "GetUserModel.h"

@implementation GetUserModel


+(usergetuser *)usergetuserwithuserid:(NSString *)userid
{
    if (!userid) {
        return nil;
    }
    return [usergetuser readObjectForKey:MODELOBJECTKEY(userid)];
}

+(void)usergetprofile:(NSString *)userid
             progress:(ProgressBlock)progress
     usergetuserblock:(GetUserModelBlock)usergetuserblock
{
    [API_GETUSER_SHOTS cancel];
    API_GETUSER_SHOTS * api = [API_GETUSER_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    
    api.whenUpdate = ^
    {
        @normalize(api);
        if ( api.sending )
        {
            progress(RELOADING);
        }
        else
        {
            if ( api.succeed )
            {
                if ( nil == api.resp)
                {
                    api.failed = YES;
                    progress(FAILED);
                }
                else
                {
                    usergetuserblock(api.resp);
                    [usergetuser saveObject:api.resp.usergetuser forKey:MODELOBJECTKEY(userid)];
                }
            }
            else
            {
                progress(FAILED);
            }
        }
    };
    
    [api send];
}
@end
