//    												
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  ___ \
//    	\ \  __<  \ \  __\_ \ \  __\_		
//    	 \ \_____\ \ \_____\ \ \____ _\
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-03 09:15:37 +0000
//

#import "GetUser.h"
#import <objc/runtime.h>

#pragma mark - GetUser

@implementation GetUser

@synthesize Result = _Result;
@synthesize usergetuser = _usergetuser;

- (BOOL)validate
{
	return YES;
}
@end

#pragma mark - usergetuser

@implementation usergetuser

@synthesize address = _address;
@synthesize city = _city;
@synthesize country = _country;
@synthesize district = _district;
@synthesize hostmonth = _hostmonth;
@synthesize hostyear = _hostyear;
@synthesize housetype = _housetype;
@synthesize ishoster = _ishoster;
@synthesize nickname = _nickname;
@synthesize outsidetype = _outsidetype;
@synthesize priceperday = _priceperday;
@synthesize province = _province;
@synthesize userdescription = _userdescription;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userimageid = _userimageid;
@synthesize userpasswordmd5 = _userpasswordmd5;
@synthesize userpetcount = _userpetcount;

-(id)checkdata:(id)object
{
    if (!object || [[object class] isSubclassOfClass:[NSNull class]]) {
        object = @"";
    }
    return object;
}

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


@implementation REQ_GETUSER_SHOTS
@synthesize userid= _userid,platformcode = _platformcode;

- (BOOL)validate
{
    return YES;
}
@end



#pragma mark - sign in

@implementation API_GETUSER_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_GETUSER_SHOTS alloc] init] ;
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
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/getuser", [ServerConfig sharedInstance].url];
        NSLog(@"%@",[self.req objectToDictionary]);
        self.HTTP_POST(requestURI).PARAM([self.req objectToDictionary]);
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [GetUser objectFromDictionary:(NSDictionary *)result];
        }
        
        if ( nil == self.resp || NO == [self.resp validate] ||  NO == [self.resp.usergetuser validate] )
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



