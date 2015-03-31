
//    												
// title:  
// author: unknown
// date:   2014-12-15 05:48:10 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class Result;
@class setlocation;
@class usersetlocation;
 

@interface setlocation : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersetlocation *			usersetlocation;
@end

@interface usersetlocation : BeeActiveObject
@property (nonatomic, retain) NSObject *			ishoster;
@property (nonatomic, retain) NSNumber *			isonline;
@property (nonatomic, retain) NSNumber *			latitude;
@property (nonatomic, retain) NSNumber *			longitude;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end


@interface REQ_SETLOCATION_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			latitude;
@property (nonatomic, retain) NSString *			longitude; 
@end

//usersignin

@interface API_SETLOCATION_SHOTS : BeeAPI
@property (nonatomic, retain) setlocation            *   resp;
@property (nonatomic, retain) REQ_SETLOCATION_SHOTS  *   req;
@end


