//
//  GetProfileModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-4.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "GetProfileModel.h"

@implementation GetProfileModel

+(usergetprofile *)usergetprofilewithuserid:(NSString *)userid
{
    if (!userid) {
        return nil;
    }
    return [usergetprofile readObjectForKey:MODELOBJECTKEY(userid)];
}

+(void)usergetprofile:(NSString *)userid progress:(ProgressBlock)progress getprofileblock:(GetProfileModelBlock)getprofileblock
{
    [API_GETPROFILE_SHOTS cancel];
    API_GETPROFILE_SHOTS * api = [API_GETPROFILE_SHOTS api];
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
                    if (api.resp.usergetprofile.profile.userid) {
                         [usergetprofile saveObject:api.resp.usergetprofile forKey:MODELOBJECTKEY(userid)];
                    }                   
                    getprofileblock(api.resp);
                   
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
