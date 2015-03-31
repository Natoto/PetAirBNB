//
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  ___ \
//    	\ \  __<  \ \  __\_ \ \  __\_		
//    	 \ \_____\ \ \_____\ \ \_____ \
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-11-30 01:49:43 +0000
//

#import "usersignup.h"
#import "pab.h"
#pragma mark - Data


//usersignin
@implementation usersignup

- (BOOL)validate
{
    return YES;
}

@end

#pragma mark - usersignup

@implementation user_signup

@synthesize usersignup = _usersignup;
@synthesize Result = _Result;

- (BOOL)validate
{
	return YES;
}

@end


@implementation REQ_USERSIGNUP_SHOTS
@synthesize useremail=_useremail,userpasswordmd5=_userpasswordmd5,platformcode = _platformcode;

- (BOOL)validate
{
    return YES;
}
@end


#pragma mark - sign up

@implementation API_USERSIGNUP_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_USERSIGNUP_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/signup", [ServerConfig sharedInstance].url];
        NSLog(@"%@",[self.req objectToDictionary]);
        self.req.userpasswordmd5 = [self.req.userpasswordmd5 MD5];
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]);
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
         if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [user_signup objectFromDictionary:(NSDictionary *)result];
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
