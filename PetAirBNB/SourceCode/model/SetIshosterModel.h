//
//  SetIshosterModel.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "SetIshoster.h"

@interface SetIshosterModel : BeeStreamViewModel
+(void)setishoster:(NSString *)userid
          ishoster:(BOOL)ishoster
          progress:(ProgressBlock)progress
  setishosterblock:(void(^)(SetIshoster * setishosterblock))setishosterblock;
@end
