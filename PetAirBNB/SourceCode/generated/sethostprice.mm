 												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:57:15 +0000
//

#import "sethostprice.h"
 

#pragma mark - sethostprice

@implementation sethostprice

@synthesize Result = _Result;
@synthesize usersethostprice = _usersethostprice;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersethostprice

@implementation usersethostprice

@synthesize ishoster = _ishoster;
@synthesize priceperday = _priceperday;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

