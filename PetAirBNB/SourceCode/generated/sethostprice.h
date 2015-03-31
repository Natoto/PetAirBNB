 											
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:57:15 +0000
//

#import "Bee.h"

#pragma mark - models

@class Result;
@class sethostprice;
@class usersethostprice;
 

@interface sethostprice : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersethostprice *			usersethostprice;
@end

@interface usersethostprice : BeeActiveObject
@property (nonatomic, retain) NSObject *			ishoster;
@property (nonatomic, retain) NSNumber *			priceperday;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

