//    												
//    												
//    	 ______    ______    ______					
//    	/\  __ \  /\  ___\  /\  __\
//    	\ \  __<  \ \  __\_ \ \ __\_
//    	 \ \_____\ \ \_____\ \ \____\
//    	  \/_____/  \/_____/  \/_____/			
//    												
//    												
//    												
// title:  
// author: unknown
// date:   2014-11-30 01:49:43 +0000
//

#import "Bee.h"
#import "PetAirbnbPre.h"
#import "pab.h"
#import "usersignin.h"


#pragma mark - models

@class usersignin;
@class Result;
@class user_signup;
@class usersignup;

@interface usersignup :  usersignin
@end


@interface user_signup : BeeActiveObject
@property (nonatomic, retain) usersignup *			usersignup;
@property (nonatomic, retain) Result *			Result;
@end



@interface REQ_USERSIGNUP_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *            userpasswordmd5;
@end

//usersignin

@interface API_USERSIGNUP_SHOTS : BeeAPI
@property (nonatomic, retain) user_signup            *   resp;
@property (nonatomic, retain) REQ_USERSIGNUP_SHOTS  *   req;
@end


