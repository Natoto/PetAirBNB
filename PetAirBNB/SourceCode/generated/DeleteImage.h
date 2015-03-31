//
//  DeleteImage.h
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pab.h"

@class userdeleteimage;
@interface DeleteImage : BeeActiveObject
@property (nonatomic, retain) Result *			Result;
@property (nonatomic, retain) userdeleteimage *			userdeleteimage;
@end

@interface userdeleteimage : BeeActiveObject
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			userimageid;
@property (nonatomic, retain) NSString *			imageurl;
@end



@interface REQ_DELETEIMAGE_SHOTS : BeeActiveObject
@property (nonatomic, retain) NSString *			platformcode;
@property (nonatomic, retain) NSString *			userid;
@property (nonatomic, retain) NSString *			imageurl;
@end

//usersignin

@interface API_DELETEIMAGE_SHOTS : BeeAPI
@property (nonatomic, retain) DeleteImage            *   resp;
@property (nonatomic, retain) REQ_DELETEIMAGE_SHOTS  *   req;
@end