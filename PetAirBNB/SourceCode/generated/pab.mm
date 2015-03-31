 
#import "Bee_SystemInfo.h"
#import "pab.h"
/*
0 参数错误
1 通常错误，一般为程序内部异常
2 验证 Token 正确（部分 API 无需验证 Token）
3 验证 Token 错误（部分 API 无需验证 Token）
100 数据创建成功
101 数据创建部分成功（较少遇到）
102 数据更新成功
103 数据更新部分成功（较少遇到）
104 数据移除成功
105 数据移除部分成功（较少遇到）
106 数据获取成功
200 数据创建失败
201 数据创建失败由于数据冲突
202 数据创建失败由于数据依赖
203 数据更新失败
204 数据更新失败由于数据冲突
205 数据更新失败由于数据依赖
206 数据移除失败
207 数据获取失败
208 数据获取失败由于数据依赖
209 数据获取失败由于无所需数据
*/

#pragma mark - Result

@implementation Result

@synthesize ReturnCode = _ReturnCode;

- (BOOL)validate
{
    return YES;
}

-(NSString *)Message
{
    return [Result errmessage:self.ReturnCode];
}

-(BOOL)isError
{
    if(self.ReturnCode.integerValue==0 | self.ReturnCode.integerValue ==2)
    {
        return NO;
    }
    return (self.ReturnCode.integerValue <=106)? NO : YES;
}

+(NSString *)message:(Result *)result
{
   return [Result errmessage:result.ReturnCode];
}

+(NSString *)errmessage:(NSNumber *)error_code
{
    NSString *message = nil;
    switch (error_code.integerValue) {
        case 0:
            message = @"参数错误";
            break;
        case 1:
            message = @"常用错误，一般为程序内部异常";
            break;
        case 2:
            message = @"验证 Token 正确";
            break;
        case 3:
            message = @"验证 Token 错误";
            break;
        case 100:
            message = @"数据创建成功";
            break;
        case 102:
            message = @"数据更新成功";
            break;
        case 101:
            message = @"数据创建部分成功";
            break;
        case 103:
            message = @"数据更新部分成功";
            break;
        case 104:
            message = @"数据移除成功";
            break;
        case 105:
            message = @"数据移除部分成功";
            break;
        case 106:
            message = @"数据获取成功";
            break;
        case 200:
            message = @"数据创建失败";
            break;
        case 201:
            message = @"数据创建失败由于数据冲突";
            break;
        case 202:
            message = @"数据创建失败由于数据依赖";
            break;
        case 203:
            message = @"数据更新失败";
            break;
        case 204:
            message = @"数据更新失败由于数据冲突";
            break;
        case 205:
            message = @"数据更新失败由于数据依赖";
            break;
        case 206:
            message = @"数据移除失败";
            break;
        case 207:
            message = @"数据获取失败";
            break;
        case 208:
            message = @"数据获取失败由于数据依赖";
            break;
        case 209:
            message = @"数据获取失败由于无所需数据";
            break;
        default:
            message = @"未知";
            break;
    }
    return message;
}

@end

@implementation STATUS
@synthesize ecode=_ecode;
@synthesize emsg=_emsg;

+(NSString *)errmessage:(ERROR_CODE)error_code
{
    NSString *message = nil;
    switch (error_code) {
        case ERR_ADDFRIEND:
            message = @"添加失败";
            break;
        case ERR_LOGIN:
            message = @"登录失败";
            break;
        case ERR_RIG:
            message = @"注册失败";
            break;
        case ERR_FRESHERROR:
            message = @"刷新失败";
            break;
        case ERR_MSGSENDERROR:
            message = @"消息发送失败";
            break;
        default:
            message = @"失败";
            break;
    }
    return message;
}
@end

#pragma mark - config

@implementation ServerConfig

//@synthesize url = _url;
//@synthesize idowebsiteurl = _idowebsiteurl;
//@synthesize feedbackUrl     = _feedbackUrl;
//@synthesize aboutUsLeftArray    = _aboutUsLeftArray;
//@synthesize aboutUsRightArray   = _aboutUsRightArray;
//@synthesize idologurl = _idologurl;
DEF_SINGLETON( ServerConfig )
-(id)init
{
    self = [super init];
    if (self) {
//        //获取系统当前的时间戳
//        NSTimeZone *zone = [NSTimeZone defaultTimeZone];//获得当前应用程序默认的时区
//        NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];//以秒为单位返回当前应用程序与世界标准时间（格林威尼时间）的时差
//        NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
//        NSTimeInterval timeInterval2 = [localeDate timeIntervalSince1970];
//        NSString * tokenid =@"654321";
//        NSString * dztoapp = @"dztoapp";
//        NSString * tokenkey =[NSString stringWithFormat:@"%@%d%@",tokenid,(NSInteger)timeInterval2,dztoapp];
//        tokenkey=[tokenkey MD5].lowercaseString;
//        
//        NSString *tokenstr =[NSString stringWithFormat:@"tokenid=%@&time=%d&tokenkey=%@",tokenid,(NSInteger)timeInterval2,tokenkey];
//        tokenstr = [tokenstr MD5].lowercaseString;
//        
//        NSString * urlkey =[NSString stringWithFormat:@"&ostype=2&time=%d&tokenid=%@&token=%@",(NSInteger)timeInterval2,tokenid,tokenstr.URLEncoding];
//        
//        _urlpostfix = urlkey;
//        
//        NSLog(@"%@",_urlpostfix);
        
    }
    return self;
}
-(NSString *)platformcode
{
    if ([BeeSystemInfo isDevicePhone]) {
        return @"1001";
    }
    else if([BeeSystemInfo isDevicePad])
    {
        return @"1101";
    }
    return @"1001";
}


@end
 
