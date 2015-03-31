//
//  UpdateImage.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "bee.h"
#import <Foundation/Foundation.h>
#import "pab.h"

@class useruploadimage;
@interface UploadImage : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) useruploadimage *			useruploadimage;
@end

@interface useruploadimage : BeeActiveObject
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userimageid;
@property (nonatomic, retain) NSString *			imageurl;
@end



@interface REQ_UPDATEIMAGE_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSMutableData  *			image;
@end

//usersignin

@interface API_UPLOADIMAGE_SHOTS : BeeAPI
@property (nonatomic, retain) UploadImage            *   resp;
@property (nonatomic, retain) REQ_UPDATEIMAGE_SHOTS  *   req;
@end
