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
// date:   2014-12-03 09:11:50 +0000
//

#import "GetProfile.h"



#pragma mark - getprofile

@implementation GetProfile

@synthesize Result = _Result;
@synthesize usergetprofile = _usergetprofile;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - images

@implementation images

@synthesize imageurl = _imageurl;
@synthesize userid = _userid;
@synthesize userimageid = _userimageid;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - profile

@implementation profile

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
    unsigned int numIvars = 0;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        
        NSString *key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        // 若此变量未在类结构体中声明而只声明为Property，则变量名加前缀 '_'下划线
        // 比如 @property(retain) NSString *abc;则 key == _abc;
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        //　获取变量值
        id value = [self valueForKey:key];
        if (!value || [[value class] isSubclassOfClass:[NSNull class]]) {
            value = @"";
        }
        [self setValue:value forKey:key];
    }
    free(ivars);
    return YES;
}
@end

#pragma mark - usergetprofile

@implementation usergetprofile

@synthesize images = _images;
@synthesize profile = _profile;

CONVERT_PROPERTY_CLASS( images, images );

- (BOOL)validate
{
	return YES;
}

@end



@implementation REQ_GETPROFILE_SHOTS
@synthesize userid= _userid,platformcode = _platformcode;

- (BOOL)validate
{
    return YES;
}
@end



#pragma mark - sign in

@implementation API_GETPROFILE_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_GETPROFILE_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/getprofile", [ServerConfig sharedInstance].url];
        NSLog(@"%@",[self.req objectToDictionary]);        
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]);
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [GetProfile objectFromDictionary:(NSDictionary *)result];
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



