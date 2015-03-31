//
//  BaseTableViewController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"
@implementation BaseTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:0];
//    self.dataDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{UITextAttributeTextColor:CLR_DEFAULT}];
    [self setExtraCellLineHidden:self.tableView];
    [self setupRefresh];
    
}


- (void)setExtraCellLineHidden:(UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的refreshView)
    self.noHeaderFreshView = NO;
    [self.tableView headerBeginRefreshing];
    self.noFooterView = YES;
//    if (!self.noHeaderFreshView) {
//        [self.tableView addHeaderWithTarget:self action:@selector(refreshView)];
//        [self.tableView headerBeginRefreshing];
//    }
//    if (!self.noFooterView) {
        // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
//        [self.tableView addFooterWithTarget:self action:@selector(getNextPageView)];
//    }
}

-(void)setNoHeaderFreshView:(BOOL)noHeaderFreshView
{
    _noHeaderFreshView = noHeaderFreshView;
    if (noHeaderFreshView) {
        [self.tableView removeHeader];
    }
    else
    {
       [self.tableView addHeaderWithTarget:self action:@selector(refreshView)];
    }
}

-(void)setNoFooterView:(BOOL)noFooterView
{
    _noFooterView = noFooterView;
    if (noFooterView) {
        [self.tableView removeFooter];
    }
    else
    {
        [self.tableView addFooterWithTarget:self action:@selector(getNextPageView)];
    }
}


-(void)refreshView
{
}
-(void)removeFooterView{
}

-(void)setFooterView{
}

//调用上下拉需要的

//加载调用的方法
-(void)getNextPageView
{
    
}

-(void)startHeaderLoading
{
    [self.tableView headerBeginRefreshing];
}
-(void)FinishedLoadData
{
    [self.tableView headerEndRefreshing];
    [self.tableView footerEndRefreshing];
}

-(void)noMore
{
    [self.tableView removeFooter];
}

-(void)finishReloadingData
{
    [self.tableView headerEndRefreshing];
    [self.tableView footerEndRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
