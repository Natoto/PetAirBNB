 												
//    												
// title:  
// author: unknown
// date:   2014-12-15 07:15:31 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class Result;
@class createpet;
@class petcreatepet;


@interface createpet : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) petcreatepet *			petcreatepet;
@end

@interface petcreatepet : BeeActiveObject
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

