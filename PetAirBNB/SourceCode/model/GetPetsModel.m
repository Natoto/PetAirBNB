//
//  GetPetsModel.m
//  PetAirBNB
//
//  Created by nonato on 14-12-17.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "GetPetsModel.h"

@implementation GetPetsModel


+(void)getpets:(NSString *)userid
      progress:(ProgressBlock)progress
  getpetsblock:(void(^)(getpets * getpetsblock))getpetsblock
{
    
    getpets * agetpets = [getpets readObjectForKey:@"getpets"];
    if (agetpets) {
        getpetsblock(agetpets);
    }
    
    [API_GETPETS_SHOTS cancel];
    API_GETPETS_SHOTS * api = [API_GETPETS_SHOTS api];
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
                    if (!api.resp.Result.isError) {
                        [getpets saveObject:api.resp forKey:@"getpets"];
                    }
                    getpetsblock(api.resp);
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

+(void)getapet:(NSString *)userid petid:(NSString *)petid progress:(ProgressBlock)progress getpetblock:(void (^)(getpet *))getpetblock
{
    
     getpet * agetpet = [getpet readObjectForKey:@"getpet"];
    if (agetpet) {
        getpetblock(agetpet);
    }
    [API_GETPET_SHOTS cancel];
    API_GETPET_SHOTS * api = [API_GETPET_SHOTS api];
    @weakify(api);
    api.req.userid  = userid;
    api.req.petid = petid;
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
                    if (!api.resp.Result.isError) {
                        [getpet saveObject:api.resp forKey:@"getpet"];
                    }
                    getpetblock(api.resp);
                    
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
