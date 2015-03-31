   												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:31:01 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class Result;
@class Sethosthouse;
@class usersethosthouse;

 

@interface Sethosthouse : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersethosthouse *			usersethosthouse;
@end

@interface usersethosthouse : BeeActiveObject
@property (nonatomic, retain) NSString *			housetype;
@property (nonatomic, retain) NSObject *			ishoster;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

