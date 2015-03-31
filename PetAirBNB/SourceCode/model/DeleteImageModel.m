//
//  DeleteImageModel.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "DeleteImageModel.h"

@implementation DeleteImageModel

+(void)deleteimage:(NSString *)userid
          imageurl:(NSString *)imageurl
          progress:(ProgressBlock)progress
  deleteimageblock:(void (^)(DeleteImage *))deleteimageblock
{
    [API_DELETEIMAGE_SHOTS cancel];
    API_DELETEIMAGE_SHOTS * api = [API_DELETEIMAGE_SHOTS api];
    @weakify(api);
    
    api.req.userid  = userid;
    api.req.imageurl = imageurl;
    
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
                    deleteimageblock(api.resp);
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
