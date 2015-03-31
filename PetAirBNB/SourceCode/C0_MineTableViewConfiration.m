//
//  C0_MineTableViewConfiration.m
//  PetAirbnb
//
//  Created by nonato on 14-11-28.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C0_MineTableViewConfiration.h"
#import <UIKit/UIKit.h>

@interface C0_MineTableViewConfiration()
@end;

@implementation C0_MineTableViewConfiration

-(id)init
{
    self=[super init];
    if (self) {
//        NSURL *plistURL=[[NSBundle mainBundle] URLForResource:@"ContactsDetail" withExtension:@"plist"];
//        NSDictionary *plist=[NSDictionary dictionaryWithContentsOfURL:plistURL];
//        self.sections=[plist valueForKey:@"sections"];
    }
    return self;
}

-(id)initWithResource:(NSString *)resource
{
    self=[super init];
    if (self) {
        NSURL *plistURL=[[NSBundle mainBundle] URLForResource:resource withExtension:@"plist"];
        NSMutableDictionary *plist=[NSMutableDictionary dictionaryWithContentsOfURL:plistURL];
        self.sections= [plist valueForKey:@"sections"];
                
    }
    return self;
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *sectionDict=[self.sections objectAtIndex:section];
    NSArray *rows=[sectionDict objectForKey:@"rows"];
    return rows.count;
}

-(NSInteger)numberOfSections
{
    return self.sections.count;
}

-(NSString *)headerInSection:(NSInteger)section
{
    NSDictionary *sectionDict=[self.sections objectAtIndex:section];
    return [sectionDict objectForKey:@"header"];
}

-(void)setValue:(id)value key:(NSString *)key indexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionIndex=[indexPath section];
    NSUInteger rowIndex = [indexPath row];
    NSMutableDictionary *section= [NSMutableDictionary dictionaryWithDictionary:[self.sections objectAtIndex:sectionIndex]];
    NSMutableArray *rows= [NSMutableArray arrayWithArray:[section objectForKey:@"rows"]];
    
    NSMutableDictionary * row = [NSMutableDictionary dictionaryWithDictionary:[rows objectAtIndex:rowIndex]];
    
    [row setValue:value forKey:key];
    [rows setObject:row atIndexedSubscript:rowIndex];
    [section setObject:rows forKey:@"rows"];
    [self.sections setObject:section atIndexedSubscript:sectionIndex];
}

-(NSDictionary *)rowForIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionIndex=[indexPath section];
    NSUInteger rowIndex = [indexPath row];
    NSDictionary *section=[self.sections objectAtIndex:sectionIndex];
    NSArray *rows=[section objectForKey:@"rows"];
    NSDictionary *row=[rows objectAtIndex:rowIndex];
    return row;
}

-(NSString *)cellClassnameForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row valueForKey:@"class"];
}

-(NSArray *)valuesForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row valueForKey:@"values"];
}
//属性关键字key
-(NSString *)attributeKeyForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"key"];
}

-(NSString *)actionForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"action"];
}

-(NSString *)labelForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"label"];
}

-(NSString *)detailForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"detail"];
}
//
-(BOOL)accessoryDetailForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [[row objectForKey:@"accessory"] isEqualToString:@"detail"];
}

-(NSString *)valueForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"value"];
}

@end
