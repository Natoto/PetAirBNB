//
//  GetNearusersModel.m
//  PetAirBNB
//
//  Created by nonato on 14-12-15.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "GetNearusersModel.h"

@implementation GetNearusersModel

+(NSArray *)getnearusers
{
    return [usergetnearusers  readObjectForKey:KEY_USERGETNEARUSERS];
}
+(void)getnearusers:(NSString *)userid
           latitude:(NSString *)latitude
          longitude:(NSString *)longitude
              range:(NSString *)range
           progress:(ProgressBlock)progress
   getnearusersblock:(void (^)(getnearusers *))getnearusersblock
{
    [API_GETNEARUSERS_SHOTS cancel];
    API_GETNEARUSERS_SHOTS * api = [API_GETNEARUSERS_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.latitude = latitude;
    api.req.longitude = longitude;
    api.req.range = range;
    
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
                    getnearusersblock(api.resp);
                    [usergetnearusers saveObject:api.resp.usergetnearusers forKey:KEY_USERGETNEARUSERS];
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


+(void)setlocation:(NSString *)userid
          latitude:(NSString *)latitude
         longitude:(NSString *)longitude
          progress:(ProgressBlock)progress
  setlocationblock:(void (^)(setlocation *))setlocationblock
{
    
    [API_SETLOCATION_SHOTS cancel];
    API_SETLOCATION_SHOTS * api = [API_SETLOCATION_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.latitude = latitude;
    api.req.longitude = longitude;
    
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
                    setlocationblock(api.resp);
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
