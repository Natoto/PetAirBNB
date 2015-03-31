 												
//    												
// title:  
// author: unknown
// date:   2014-12-15 08:25:40 +0000
//

#import "getpet.h"
 

#pragma mark - getpet

@implementation getpet

@synthesize Result = _Result;
@synthesize petgetpet = _petgetpet;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - petgetpet

@implementation petgetpet

@synthesize agemonth = _agemonth;
@synthesize ageyear = _ageyear;
@synthesize canbirth = _canbirth;
@synthesize canwithcat = _canwithcat;
@synthesize datecreated = _datecreated;
@synthesize dateupdated = _dateupdated;
@synthesize description = _description;
@synthesize gender = _gender;
@synthesize hasvaccine1 = _hasvaccine1;
@synthesize hasvaccine2 = _hasvaccine2;
@synthesize hasvaccine3 = _hasvaccine3;
@synthesize petid = _petid;
@synthesize petname = _petname;
@synthesize size = _size;
@synthesize type = _type;
@synthesize userid = _userid;

- (BOOL)validate
{
	return YES;
}

@end


@implementation REQ_GETPET_SHOTS

-(BOOL)validate
{
    return YES;
}
@end





#pragma mark - sign in

@implementation API_GETPET_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_GETPET_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/pet/getpet", [ServerConfig sharedInstance].url];
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]).TIMEOUT(180);
        
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [getpet objectFromDictionary:(NSDictionary *)result];
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


