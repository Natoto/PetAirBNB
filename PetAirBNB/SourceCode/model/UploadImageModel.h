//
//  UploadImageModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "UploadImage.h"

@interface UploadImageModel : BeeStreamViewModel

+(void)uploadimage:(NSString *)userid
             image:(NSData *)imagedata
             progress:(ProgressBlock)progress
     usergetuserblock:(void(^)(UploadImage * uploadimageblock))uploadimageblock;

@end
