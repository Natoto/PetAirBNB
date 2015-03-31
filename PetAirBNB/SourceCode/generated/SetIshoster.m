//
//  SetIshoster.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "SetIshoster.h"


@implementation SetIshoster

@synthesize Result = _Result;
@synthesize usersetishoster = _usersetishoster;

- (BOOL)validate
{
    return YES;
}

@end

@implementation usersetishoster
@synthesize userid = _userid;
@synthesize useremail = _useremail;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
    return YES;
}
@end

@implementation REQ_SETISHOSTER_SHOTS

-(BOOL)validate
{
    return YES;
}
@end





#pragma mark - sign in

@implementation API_SETISHOSTER_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_SETISHOSTER_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/setishoster", [ServerConfig sharedInstance].url];
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]).TIMEOUT(180);
        
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [SetIshoster objectFromDictionary:(NSDictionary *)result];
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