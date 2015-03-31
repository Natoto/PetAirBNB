 											
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:55:36 +0000
//

#import "sethostexperience.h"
 

#pragma mark - sethostexperience

@implementation sethostexperience

@synthesize Result = _Result;
@synthesize usersethostexperience = _usersethostexperience;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersethostexperience

@implementation usersethostexperience

@synthesize hostmonth = _hostmonth;
@synthesize hostyear = _hostyear;
@synthesize ishoster = _ishoster;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

