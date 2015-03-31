//
//  UpdateProfileModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "UpdateProfileModel.h"

@implementation UpdateProfileModel

#pragma mark - 登录 
+(userupdateprofile *)userupdateprofilewithuserid:(NSString *)userid
{
    if (!userid) {
        return nil;
    }
    return [userupdateprofile readObjectForKey:MODELOBJECTKEY(userid)];
}

+(void)updateprofile:(NSString *)userid
            nickname:(NSString *)nickname
             country:(NSString *)country
            province:(NSString *)province
                city:(NSString *)city
            district:(NSString *)district
             address:(NSString *)address
     userdescription:(NSString *)userdescription
            progress:(ProgressBlock)progress
  updateprofileblock:(UpdateProfileBlock)updateprofileblock
{
    [API_UPDATEPROFILE_SHOTS cancel];
    API_UPDATEPROFILE_SHOTS * api = [API_UPDATEPROFILE_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.nickname  = nickname;
    api.req.country  = country;
    api.req.province  = province;
    api.req.city  = city;
    api.req.district  = district;
    api.req.address  = address;
    api.req.userdescription  = userdescription;
    
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
                    [userupdateprofile saveObject:api.resp.userupdateprofile forKey:MODELOBJECTKEY(userid)];
                    updateprofileblock(api.resp);
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
