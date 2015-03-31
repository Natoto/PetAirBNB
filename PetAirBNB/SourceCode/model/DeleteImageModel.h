//
//  DeleteImageModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "DeleteImage.h"
@interface DeleteImageModel : BeeStreamViewModel

+(void)deleteimage:(NSString *)userid
          imageurl:(NSString *)imageurl
          progress:(ProgressBlock)progress
  deleteimageblock:(void(^)(DeleteImage * deleteimageblock))deleteimageblock;
@end
