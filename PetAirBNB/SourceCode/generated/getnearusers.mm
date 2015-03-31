//    												
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  ___\			
//    	\ \  __<  \ \  __\_ \ \  __\_		
//    	 \ \_____\ \ \_____\ \ \_____\		
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 05:05:22 +0000
//

#import "getnearusers.h"

#pragma mark - Result


#pragma mark - getnearusers

@implementation getnearusers

@synthesize Result = _Result;
@synthesize usergetnearusers = _usergetnearusers;

CONVERT_PROPERTY_CLASS( usergetnearusers, usergetnearusers );

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usergetnearusers

@implementation usergetnearusers

@synthesize ishoster = _ishoster;
@synthesize isonline = _isonline;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize nickname = _nickname;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userimageurl = _userimageurl;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end


@implementation REQ_GETNEARUSERS_SHOTS

-(BOOL)validate
{
    return YES;
}
@end





#pragma mark - sign in

@implementation API_GETNEARUSERS_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_GETNEARUSERS_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/getnearusers", [ServerConfig sharedInstance].url];
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]).TIMEOUT(180);
        
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [getnearusers objectFromDictionary:(NSDictionary *)result];
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

