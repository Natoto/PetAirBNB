//
//  SetIshosterModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "SetIshosterModel.h"

@implementation SetIshosterModel


+(void)setishoster:(NSString *)userid
          ishoster:(BOOL)ishoster
          progress:(ProgressBlock)progress
  setishosterblock:(void (^)(SetIshoster *))setishosterblock
{
    [API_SETISHOSTER_SHOTS cancel];
    API_SETISHOSTER_SHOTS * api = [API_SETISHOSTER_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.ishoster = ishoster;
    
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
                    setishosterblock(api.resp);
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
