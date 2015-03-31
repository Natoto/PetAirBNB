
//    												
// title:  
// author: unknown
// date:   2014-12-15 08:25:40 +0000
//

#import "Bee.h"
#import "pab.h"

#pragma mark - models

@class Result;
@class getpet;
@class petgetpet;

 

@interface getpet : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) petgetpet *			petgetpet;
@end

@interface petgetpet : BeeActiveObject
@property (nonatomic, retain) NSNumber *			agemonth;
@property (nonatomic, retain) NSNumber *			ageyear;
@property (nonatomic, retain) NSNumber *			canbirth;
@property (nonatomic, retain) NSNumber *			canwithcat;
@property (nonatomic, retain) NSString *			datecreated;
@property (nonatomic, retain) NSString *			dateupdated;
@property (nonatomic, retain) NSString *			description;
@property (nonatomic, retain) NSObject *			gender;
@property (nonatomic, retain) NSNumber *			hasvaccine1;
@property (nonatomic, retain) NSNumber *			hasvaccine2;
@property (nonatomic, retain) NSNumber *			hasvaccine3;
@property (nonatomic, retain) NSString *			petid;
@property (nonatomic, retain) NSString *			petname;
@property (nonatomic, retain) NSString *			size;
@property (nonatomic, retain) NSString *			type;
@property (nonatomic, retain) NSString *			userid;
@end


@interface REQ_GETPET_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			petid;
@end


@interface API_GETPET_SHOTS : BeeAPI
@property (nonatomic, retain) getpet            *   resp;
@property (nonatomic, retain) REQ_GETPET_SHOTS  *   req;
@end


