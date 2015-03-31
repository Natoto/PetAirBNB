 												
//    												
// title:  
// author: unknown
// date:   2014-12-15 05:48:10 +0000
//

#import "setlocation.h"
#pragma mark - setlocation

@implementation setlocation

@synthesize Result = _Result;
@synthesize usersetlocation = _usersetlocation;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersetlocation

@implementation usersetlocation

@synthesize ishoster = _ishoster;
@synthesize isonline = _isonline;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end


@implementation REQ_SETLOCATION_SHOTS

-(BOOL)validate
{
    return YES;
}
@end





#pragma mark - sign in

@implementation API_SETLOCATION_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_SETLOCATION_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/setlocation", [ServerConfig sharedInstance].url];
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]).TIMEOUT(180);
        
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [setlocation objectFromDictionary:(NSDictionary *)result];
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


