//
//  usersigninModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "usersigninModel.h"

@implementation usersigninModel
DEF_SINGLETON(usersigninModel)

-(LOGIN_SESSION *)session
{
    if (!_session) {
        _session = [usersigninModel defaultUser];
    }
    return _session;
}


+(LOGIN_SESSION *)defaultUser
{
    LOGIN_SESSION * user = [LOGIN_SESSION readObjectForKey:DEFAULT_USER];
    return user;
}

+(usersignin *)usersigninwithemail:(NSString *)email;
{
    if (!email) {
        return nil;
    }
    return [usersignin readObjectForKey:email];
}
#pragma mark - 登录
+(void)usersignin:(NSString *)usermail password:(NSString *)password progress:(ProgressBlock)progress signinblock:(SignInBlock)signinblock
{
    [API_USERSIGNIN_SHOTS cancel];
    API_USERSIGNIN_SHOTS * api = [API_USERSIGNIN_SHOTS api];
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
                    signinblock(api.resp);
                    [usersignin saveObject:api.resp.usersignin forKey:MODELOBJECTKEY(usermail)];
                    
                    LOGIN_SESSION * session = [[LOGIN_SESSION alloc] init];
                    session.useremail = usermail;
                    session.userpassword = password;
                    session.userid = api.resp.usersignin.userid;
                    [LOGIN_SESSION saveObject:session forKey:DEFAULT_USER];
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

//#pragma mark -
//
//- (void)firstPage
//{
//    [self gotoPage:1];
//}
//
//- (void)nextPage
//{
//    [self firstPage];
//}
//
//- (void)gotoPage:(NSUInteger)page
//{
//    
//    [API_USERSIGNIN_SHOTS cancel];
//    API_USERSIGNIN_SHOTS * api = [API_USERSIGNIN_SHOTS api];
//    @weakify(api);
//    @weakify(self);
//    
//    api.req.useremail = _useremail;
//    api.req.userpasswordmd5  = _userpasswordmd5;
//    api.whenUpdate = ^
//    {
//        @normalize(api);
//        @normalize(self);
//        if ( api.sending )
//        {
//            [self sendUISignal:self.RELOADING];
//        }
//        else
//        {
//            if ( api.succeed )
//            {
//                if ( nil == api.resp)
//                {
//                    api.failed = YES;
//                    [self sendUISignal:self.FAILED withObject:[Result errmessage:api.resp.Result.ReturnCode]];
//                }
//                else
//                {
//                    self.shots = api.resp;
//                    self.more = NO;
//                    self.loaded = YES;
//                    [self saveCache];
//                    [self sendUISignal:self.RELOADED];
//                }
//            }
//            else
//            {
//                [self sendUISignal:self.FAILED withObject:[Result message:api.resp.Result]];
//            }
//        }
//    };
//    
//    [api send];
//}

@end
