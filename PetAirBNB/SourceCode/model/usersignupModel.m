//
//  usersignupModel.m
//  PetAirbnb
//
//  Created by BooB on 14-11-30.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "usersignupModel.h"

@implementation usersignupModel
DEF_SINGLETON(usersignupModel)

- (void)load
{
    self.autoSave = YES;
    self.autoLoad = YES;
}

- (void)unload
{
    _userpasswordmd5 = nil;
    _useremail = nil;
    _shots=nil;
}

#pragma mark -

- (void)loadCache
{
//    NSString  *key= MODELOBJECTKEY(self.useremail);
//    self.shots=[usersignup readObjectForKey:key];
}

- (void)saveCache
{
    [usersignup saveObject:self.shots forKey:MODELOBJECTKEY(self.useremail)];
}

- (void)clearCache
{
    self.loaded=NO;
}


+(usersignup *)usersignupwithemail:(NSString *)email
{
    if (!email) {
        return nil;
    }
   return [usersignup readObjectForKey:email];
}

#pragma mark - 注册
+(void)usersignupwith:(NSString *)usermail password:(NSString *)password progress:(ProgressBlock)progress signupblock:(SignupBlock)signupblock
{
    [API_USERSIGNUP_SHOTS cancel];
    API_USERSIGNUP_SHOTS * api = [API_USERSIGNUP_SHOTS api];
    @weakify(api);
    
    api.req.useremail = usermail;
    api.req.userpasswordmd5  = password;
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
                    signupblock(api.resp);
                    [usersignup saveObject:api.resp.usersignup forKey:MODELOBJECTKEY(usermail)];
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
