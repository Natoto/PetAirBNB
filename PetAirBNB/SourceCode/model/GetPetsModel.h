//
//  GetPetsModel.h
//  PetAirBNB
//
//  Created by nonato on 14-12-17.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "Bee_StreamViewModel.h"
#import "getpets.h"
#import "getpet.h"
@interface GetPetsModel : BeeStreamViewModel

+(void)getpets:(NSString *)userid
          progress:(ProgressBlock)progress
  getpetsblock:(void(^)(getpets * getpetsblock))getpetsblock;

+(void)getapet:(NSString *)userid
        petid:(NSString *)petid
      progress:(ProgressBlock)progress
  getpetblock:(void(^)(getpet * getpetblock))getpetblock;

@end
