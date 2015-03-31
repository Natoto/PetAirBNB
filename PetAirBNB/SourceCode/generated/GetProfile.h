//    												
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  ___ \
//    	\ \  __<  \ \  __\_ \ \  __\_		
//    	 \ \_____\ \ \_____\ \ \_____ \
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-12-03 09:11:50 +0000
//

#import "Bee.h"
#import "pab.h"

#pragma mark - models

@class Result;
@class GetProfile;
@class images;
@class profile;
@class usergetprofile;


@interface GetProfile : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usergetprofile *			usergetprofile;
@end

@interface images : BeeActiveObject
@property (nonatomic, retain) NSString *			imageurl;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userimageid;
@end

@interface profile : BeeActiveObject
@property (nonatomic, retain) NSString *			address;
@property (nonatomic, retain) NSString *			city;
@property (nonatomic, retain) NSString *			country;
@property (nonatomic, retain) NSString *			district;
@property (nonatomic, retain) NSString *			nickname;
@property (nonatomic, retain) NSString *			province;
@property (nonatomic, retain) NSString *			userdescription;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

@interface usergetprofile : BeeActiveObject
@property (nonatomic, retain) NSArray *				images;
@property (nonatomic, retain) profile *			profile;
@end
 

@interface REQ_GETPROFILE_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@end

//usersignin

@interface API_GETPROFILE_SHOTS : BeeAPI
@property (nonatomic, retain) GetProfile            *   resp;
@property (nonatomic, retain) REQ_GETPROFILE_SHOTS  *   req;
@end

