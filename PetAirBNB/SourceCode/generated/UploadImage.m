//
//  UpdateImage.m
//  PetAirbnb
//
//  Created by nonato on 14-12-5.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "UploadImage.h"

@implementation UploadImage

@synthesize Result = _Result;
@synthesize useruploadimage = _useruploadimage;

- (BOOL)validate
{
    return YES;
}

@end

@implementation useruploadimage
@synthesize userid = _userid;
@synthesize userimageid = _userimageid;
@synthesize imageurl = _imageurl;

- (BOOL)validate
{
    return YES;
}
@end

@implementation REQ_UPDATEIMAGE_SHOTS

-(BOOL)validate
{
    return YES;
}
@end





#pragma mark - sign in

@implementation API_UPLOADIMAGE_SHOTS

@synthesize req = _req;
@synthesize resp = _resp;

- (id)init
{
    self = [super init];
    if ( self )
    {
        self.req = [[REQ_UPDATEIMAGE_SHOTS alloc] init] ;
        self.req.platformcode = [ServerConfig sharedInstance].platformcode;
        self.resp = nil;
    }
    return self;
}

- (void)dealloc
{
    self.req = nil;
    self.resp = nil;
    //	[super dealloc];
}

- (void)routine
{
    if ( self.sending )
    {
        if ( nil == self.req || NO == [self.req validate] )
        {
            self.failed = YES;
            return;
        }
        NSString * requestURI =[NSString stringWithFormat:@"%@/user/uploadimage", [ServerConfig sharedInstance].url];
        
        self.HTTP_POST(requestURI).HEADER(@"enctype", @"multipart/form-data; boundary=AaB03x").PARAM(@"userid",self.req.userid).PARAM(@"platformcode",self.req.platformcode).FILE(@"image",self.req.image).TIMEOUT(180);
        
    }
    else if ( self.succeed )
    {
        NSObject * result = self.responseJSON;
        if ( result && [result isKindOfClass:[NSDictionary class]] )
        {
            self.resp = [UploadImage objectFromDictionary:(NSDictionary *)result];
        }
        
        if ( nil == self.resp || NO == [self.resp validate] )
        {
            self.failed = YES;
            return;
        }
    }
    else if ( self.failed )
    {
        NSLog(@"self.description===%@",self.description);
        // TODO:
    }
    else if ( self.cancelled )
    {
        NSLog(@"self.description %@",self.description);
        // TODO:
    }
}
@end
