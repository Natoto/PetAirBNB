//    												
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  ___\			
//    	\ \  __<  \ \  __\_ \ \  __\_		
//    	 \ \_____\ \ \_____\ \ \_____\		
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:59:01 +0000
//

#import "setishoster.h"

#pragma mark - Result

@implementation Result

@synthesize ReturnCode = _ReturnCode;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - setishoster

@implementation setishoster

@synthesize Result = _Result;
@synthesize usersetishoster = _usersetishoster;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - usersetishoster

@implementation usersetishoster

@synthesize ishoster = _ishoster;
@synthesize useremail = _useremail;
@synthesize userid = _userid;
@synthesize userpasswordmd5 = _userpasswordmd5;

- (BOOL)validate
{
	return YES;
}

@end

