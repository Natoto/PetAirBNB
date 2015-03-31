   												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:55:36 +0000
//

#import "Bee.h"

#pragma mark - models

@class Result;
@class sethostexperience;
@class usersethostexperience;

 

@interface sethostexperience : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersethostexperience *			usersethostexperience;
@end

@interface usersethostexperience : BeeActiveObject
@property (nonatomic, retain) NSNumber *			hostmonth;
@property (nonatomic, retain) NSNumber *			hostyear;
@property (nonatomic, retain) NSObject *			ishoster;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

