  												
// title:  
// author: unknown
// date:   2014-12-15 08:05:35 +0000
//

#import "updatepet.h"

#pragma mark - Result

 

#pragma mark - petupdatepet

@implementation petupdatepet

@synthesize agemonth = _agemonth;
@synthesize ageyear = _ageyear;
@synthesize canbirth = _canbirth;
@synthesize canwithcat = _canwithcat;
@synthesize datecreated = _datecreated;
@synthesize dateupdated = _dateupdated;
@synthesize description = _description;
@synthesize gender = _gender;
@synthesize hasvaccine1 = _hasvaccine1;
@synthesize hasvaccine2 = _hasvaccine2;
@synthesize hasvaccine3 = _hasvaccine3;
@synthesize petid = _petid;
@synthesize petname = _petname;
@synthesize size = _size;
@synthesize type = _type;
@synthesize userid = _userid;

- (BOOL)validate
{
	return YES;
}

@end

#pragma mark - updatepet

@implementation updatepet

@synthesize Result = _Result;
@synthesize petupdatepet = _petupdatepet;

- (BOOL)validate
{
	return YES;
}

@end

