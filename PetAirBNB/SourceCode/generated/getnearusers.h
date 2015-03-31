
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-15 05:05:22 +0000
//

#import "Bee.h"
#import "pab.h"

#pragma mark - models

@class Result;
@class getnearusers;
@class usergetnearusers;
 

@interface getnearusers : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) NSArray *				usergetnearusers;
@end

@interface usergetnearusers : BeeActiveObject
@property (nonatomic, retain) NSNumber *			ishoster;
@property (nonatomic, retain) NSNumber *			isonline;
@property (nonatomic, retain) NSNumber *			latitude;
@property (nonatomic, retain) NSNumber *			longitude;
@property (nonatomic, retain) NSString *			nickname;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userimageurl;
@property (nonatomic, retain) NSString *			userpasswordmd5;

@property (nonatomic, retain) NSString *			priceperday;
@property (nonatomic, retain) NSString *			distance;
@end


@interface REQ_GETNEARUSERS_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			latitude;
@property (nonatomic, retain) NSString *			longitude;
@property (nonatomic, retain) NSString *			range;
@end

//usersignin

@interface API_GETNEARUSERS_SHOTS : BeeAPI
@property (nonatomic, retain) getnearusers            *   resp;
@property (nonatomic, retain) REQ_GETNEARUSERS_SHOTS  *   req;
@end

