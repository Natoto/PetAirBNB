  												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:49:36 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class Result;
@class Sethostdate;
@class usersethostdate;


@interface Sethostdate : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersethostdate *			usersethostdate;
@end

@interface usersethostdate : BeeActiveObject
@property (nonatomic, retain) NSNumber *			ishoster;
@property (nonatomic, retain) NSString *			serviceenddate;
@property (nonatomic, retain) NSString *			servicestartdate;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

