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
// date:   2014-12-03 09:18:22 +0000
//

#import "UpdateProfile.h"

#pragma mark - Result

//@implementation Result
//
//@synthesize ReturnCode = _ReturnCode;
//
//- (BOOL)validate
//{
//	return YES;
//}
//
//@end

#pragma mark - UpdateProfile

@implementation UpdateProfile

@synthesize Result = _Result;
@synthesize userupdateprofile = _userupdateprofile;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - userupdateprofile

@implementation userupdateprofile

@synthesize address = _address;
@synthesize city = _city;
@synthesize country = _country;
@synthesize district = _district;
@synthesize nickname = _nickname;
@synthesize province = _province;
@synthesize userdescription = _userdescription;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end



@implementation REQ_UPDATEPROFILE_SHOTS
@synthesize userid= _userid,platformcode = _platformcode;

- (BOOL)validate
{
    return YES;
}
@end



#pragma mark - sign in

@implementation API_UPDATEPROFILE_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_UPDATEPROFILE_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/updateprofile", [ServerConfig sharedInstance].url];
        NSLog(@"%@",[self.req objectToDictionary]);
        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]);
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [UpdateProfile objectFromDictionary:(NSDictionary *)result];
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
