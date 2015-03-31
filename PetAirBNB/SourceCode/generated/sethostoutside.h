   												
//    												
// title:  
// author: unknown
// date:   2014-12-15 06:23:31 +0000
//

#import "Bee.h"
#import "pab.h"
#pragma mark - models

@class Result;
@class sethostoutside;
@class usersethostoutside;


@interface sethostoutside : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) usersethostoutside *			usersethostoutside;
@end

@interface usersethostoutside : BeeActiveObject
@property (nonatomic, retain) NSObject *			ishoster;
@property (nonatomic, retain) NSString *			outsidetype;
@property (nonatomic, retain) NSString *			useremail;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userpasswordmd5;
@end

