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
// date:   2014-12-03 09:18:22 +0000
//

#import "Bee.h"
#import "pab.h"

#pragma mark - models

@class UpdateProfile;
@class userupdateprofile;


@interface UpdateProfile : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) userupdateprofile *			userupdateprofile;
@end

@interface userupdateprofile : BeeActiveObject
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


@interface REQ_UPDATEPROFILE_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			nickname;
@property (nonatomic, retain) NSString *			country;
@property (nonatomic, retain) NSString *			province;
@property (nonatomic, retain) NSString *			city;
@property (nonatomic, retain) NSString *			district;
@property (nonatomic, retain) NSString *			address;
@property (nonatomic, retain) NSString *			userdescription;
@end

//usersignin

@interface API_UPDATEPROFILE_SHOTS : BeeAPI
@property (nonatomic, retain) UpdateProfile            *   resp;
@property (nonatomic, retain) REQ_UPDATEPROFILE_SHOTS  *   req;
@end

