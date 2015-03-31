
//    												
// title:  
// author: unknown
// date:   2014-12-17 07:10:34 +0000
//

#import "Bee.h"
#import "pab.h"

#pragma mark - models

@class Result;
@class getpets;
@class petgetpets;


@interface getpets : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) NSArray *				petgetpets;
@end

@interface petgetpets : BeeActiveObject
@property (nonatomic, retain) NSNumber *			agemonth;
@property (nonatomic, retain) NSNumber *			ageyear;
@property (nonatomic, retain) NSNumber *			canbirth;
@property (nonatomic, retain) NSNumber *			canwithcat;
@property (nonatomic, retain) NSString *			datecreated;
@property (nonatomic, retain) NSString *			dateupdated;
@property (nonatomic, retain) NSString *			description;
@property (nonatomic, retain) NSNumber *			gender;
@property (nonatomic, retain) NSNumber *			hasvaccine1;
@property (nonatomic, retain) NSNumber *			hasvaccine2;
@property (nonatomic, retain) NSNumber *			hasvaccine3;
@property (nonatomic, retain) NSString *			petid;
@property (nonatomic, retain) NSString *			petname;
@property (nonatomic, retain) NSString *			size;
@property (nonatomic, retain) NSString *			type;
@property (nonatomic, retain) NSString *			userid;
@end

@interface REQ_GETPETS_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@end


@interface API_GETPETS_SHOTS : BeeAPI
@property (nonatomic, retain) getpets            *   resp;
@property (nonatomic, retain) REQ_GETPETS_SHOTS  *   req;
@end

