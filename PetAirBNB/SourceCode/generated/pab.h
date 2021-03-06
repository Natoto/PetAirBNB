//
// ECMobile (Geek-Zoo Studio)
//
// generated at 2013-06-17 05:47:47 +0000
//
#import "DZ_SystemSetting.h"
#import "Bee.h"
#import <Foundation/Foundation.h>
#import "Bee_UITipsView+Block.h"

//#import "NSData+base64.h" 

typedef enum : NSInteger {
    RELOADING = -1,
    RELOADED = 1,
    FAILED = 2,
} REQUEST_TYPE;

typedef enum : NSUInteger {
    ERR_LOGIN,
    ERR_RIG,
    ERR_ADDFRIEND,
    ERR_FRESHERROR,
    ERR_MSGSENDERROR,
} ERROR_CODE;

@class Result;

@interface Result : NSObject
@property (nonatomic, retain) NSNumber *			ReturnCode;
@property (nonatomic, retain) NSString *            Message;
@property (nonatomic, assign) BOOL                  isError;
+(NSString *)errmessage:(NSNumber *)error_code;
+(NSString *)message:(Result *)result;
@end

typedef void(^ReturnBlock)(Result *resblock);
typedef void(^ProgressBlock)(REQUEST_TYPE progress);



@interface STATUS : NSObject
@property (nonatomic, retain) NSString *		ecode;
@property (nonatomic, retain) NSString *		emsg;
+(NSString *)errmessage:(ERROR_CODE)error_code;
@end

#pragma mark - config

@interface ServerConfig : NSObject

AS_SINGLETON( ServerConfig )

@property (nonatomic, retain) NSString          *	url;
@property (nonatomic, retain) NSString          *   platformcode;

//@property (nonatomic, retain) NSString          *	idowebsiteurl;
//@property (nonatomic, retain) NSString          *	idologurl;
//@property (nonatomic, copy)   NSString          *   feedbackUrl;
//@property (nonatomic, strong) NSMutableArray    *   aboutUsLeftArray;
//@property (nonatomic, strong) NSMutableArray    *   aboutUsRightArray;
//@property (nonatomic, strong) NSString          *   urlpostfix;

@end

