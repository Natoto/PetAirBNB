//
//  usersignin.m
//  PetAirbnb
//
//  Created by nonato on 14-12-3.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "usersignin.h"


@implementation usersignin

@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{ 
    return YES;
}

@end

#pragma mark - usersignin

@implementation user_signin

@synthesize usersignin = _usersignin;
@synthesize Result = _Result;

- (BOOL)validate
{
    return YES;
}

@end


#pragma mark - login sesson
@implementation LOGIN_SESSION

@end



@implementation REQ_USERSIGNIN_SHOTS
@synthesize useremail=_useremail,userpasswordmd5=_userpasswordmd5,platformcode = _platformcode;

- (BOOL)validate
{
    return YES;
}
@end



#pragma mark - sign in

@implementation API_USERSIGNIN_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_USERSIGNIN_SHOTS alloc] init] ;
        self.req.platformcode = [ServerConfig sharedInstance].platformcode;
        self.resp = nil;
    }
    return self;
}

- (void)dealloc
{
    self.req = nil;
    self.resp = nil;
    //	[super dealloc];
}

- (void)routine
{
    if ( self.sending )
    {
        if ( nil == self.req || NO == [self.req validate] )
        {
            self.failed = YES;
            return;
        }
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/signin", [ServerConfig sharedInstance].url];
        NSLog(@"%@",[self.req objectToDictionary]);
        self.req.userpasswordmd5 = [self.req.userpasswordmd5 MD5];
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]);
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [user_signin objectFromDictionary:(NSDictionary *)result];
        }
        
        if ( nil == self.resp || NO == [self.resp validate] )
        {
            self.failed = YES;
            return;
        }
    }
    else if ( self.failed )
    {
        NSLog(@"self.description===%@",self.description);
        // TODO:
    }
    else if ( self.cancelled )
    {
        NSLog(@"self.description %@",self.description);
        // TODO:
    }
}
@end
