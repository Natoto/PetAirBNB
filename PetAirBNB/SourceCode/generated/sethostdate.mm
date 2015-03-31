   												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:49:36 +0000
//

#import "sethostdate.h"

 

#pragma mark - Sethostdate

@implementation Sethostdate

@synthesize Result = _Result;
@synthesize usersethostdate = _usersethostdate;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersethostdate

@implementation usersethostdate

@synthesize ishoster = _ishoster;
@synthesize serviceenddate = _serviceenddate;
@synthesize servicestartdate = _servicestartdate;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

