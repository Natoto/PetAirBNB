 		
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-03 09:15:37 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class GetUser;
@class Result;
@class usergetuser;

@interface GetUser : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usergetuser *			usergetuser;
@end

//@interface Result : BeeActiveObject
//@property (nonatomic, retain) NSNumber *			ReturnCode;
//@end

@interface usergetuser : BeeActiveObject
@property (nonatomic, retain) NSString *			address;
@property (nonatomic, retain) NSString *			city;
@property (nonatomic, retain) NSString *			country;
@property (nonatomic, retain) NSString *			district;
@property (nonatomic, retain) NSNumber *			hostmonth;
@property (nonatomic, retain) NSNumber *			hostyear;
@property (nonatomic, retain) NSString *			housetype;
@property (nonatomic, retain) NSNumber *			ishoster;
@property (nonatomic, retain) NSString *			nickname;
@property (nonatomic, retain) NSString *			outsidetype;
@property (nonatomic, retain) NSNumber *			priceperday;
@property (nonatomic, retain) NSString *			province;
@property (nonatomic, retain) NSString *			userdescription;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userimageid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@property (nonatomic, retain) NSNumber *			userpetcount;
@end



@interface REQ_GETUSER_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@end

//usersignin

@interface API_GETUSER_SHOTS : BeeAPI
@property (nonatomic, retain) GetUser            *   resp;
@property (nonatomic, retain) REQ_GETUSER_SHOTS  *   req;
@end
