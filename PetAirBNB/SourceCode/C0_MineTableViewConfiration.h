//
//  C0_MineTableViewConfiration.h
//  PetAirbnb
//
//  Created by nonato on 14-11-28.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface C0_MineTableViewConfiration : NSObject
@property(strong,nonatomic)NSMutableArray *sections;
-(NSInteger)numberOfSections;
-(NSInteger)numberOfRowsInSection:(NSInteger)section;
-(NSString *)headerInSection:(NSInteger)section;

-(NSDictionary *)rowForIndexPath:(NSIndexPath *)indexPath;

-(NSString *)cellClassnameForIndexPath:(NSIndexPath *)indexPath;
-(NSArray *)valuesForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)attributeKeyForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)labelForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)detailForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)valueForIndexPath:(NSIndexPath *)indexPath;

-(NSString *)actionForIndexPath:(NSIndexPath *)indexPath;
-(BOOL)accessoryDetailForIndexPath:(NSIndexPath *)indexPath;

-(void)setValue:(id)value key:(NSString *)key indexPath:(NSIndexPath *)indexPath;
//是否动态生成
//-(BOOL)isDynamicSection:(NSInteger)section;
//-(NSString *)dynamicAttributeKeyForSection:(NSInteger)section;
-(id)initWithResource:(NSString *)resource;
@end
