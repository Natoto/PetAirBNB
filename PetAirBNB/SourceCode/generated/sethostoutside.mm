 												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:23:31 +0000
//

#import "sethostoutside.h"
 

#pragma mark - sethostoutside

@implementation sethostoutside

@synthesize Result = _Result;
@synthesize usersethostoutside = _usersethostoutside;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersethostoutside

@implementation usersethostoutside

@synthesize ishoster = _ishoster;
@synthesize outsidetype = _outsidetype;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

