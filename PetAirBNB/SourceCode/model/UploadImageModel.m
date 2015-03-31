//
//  UploadImageModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "UploadImageModel.h"

@implementation UploadImageModel


+(useruploadimage *)useruploadimagewithimageid:(NSString *)imageid
{
    if (!imageid) {
        return nil;
    }
    return [useruploadimage readObjectForKey:MODELOBJECTKEY(imageid)];
}

+(void)uploadimage:(NSString *)userid image:(NSData *)imagedata progress:(ProgressBlock)progress usergetuserblock:(void (^)(UploadImage *))uploadimageblock
{
    [API_UPLOADIMAGE_SHOTS cancel];
    API_UPLOADIMAGE_SHOTS * api = [API_UPLOADIMAGE_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.image = [NSMutableData dataWithData:imagedata];
    
    api.whenUpdate = ^
    {
        @normalize(api);
        if ( api.sending )
        {
            progress(RELOADING);
        }
        else
        {
            if ( api.succeed )
            {
                if ( nil == api.resp)
                {
                    api.failed = YES;
                    progress(FAILED);
                }
                else
                {
                    uploadimageblock(api.resp);
                    [useruploadimage saveObject:api.resp.useruploadimage forKey:MODELOBJECTKEY(api.resp.useruploadimage.userimageid)];
                }
            }
            else
            {
                progress(FAILED);
            }
        }
    };
    
    [api send];
}
@end
