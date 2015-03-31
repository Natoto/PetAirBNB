   												
// title:  
// author: unknown
// date:   2014-12-15 06:31:01 +0000
//

#import "sethosthouse.h"

 

#pragma mark - Sethosthouse

@implementation Sethosthouse

@synthesize Result = _Result;
@synthesize usersethosthouse = _usersethosthouse;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersethosthouse

@implementation usersethosthouse

@synthesize housetype = _housetype;
@synthesize ishoster = _ishoster;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

