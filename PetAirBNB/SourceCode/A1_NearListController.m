//
//  A1_NearListController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "A1_NearListTableViewCell.h"
#import "A1_NearListController.h"
#import <CoreLocation/CoreLocation.h>
#import "GetNearusersModel.h"
#import "usersigninModel.h"
#import "MJRefresh.h"

@interface A1_NearListController ()<CLLocationManagerDelegate>
@property(nonatomic,strong) NSString * latitude;//纬度
@property(nonatomic,strong) NSString * longitude;//经度
@property(nonatomic,strong) NSString * range;
@property (nonatomic,strong) CLLocationManager * locationManager;
@property (nonatomic,strong) CLLocation *locationHandler;
@property (nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation A1_NearListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    
    NSArray * array = [GetNearusersModel getnearusers];
    if (array.count) {
        self.dataArray = [NSMutableArray arrayWithArray:array];
    }
    if([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];//创建位置管理器
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=1000.0f;
        self.locationManager = locationManager;
        [self getCurrentLocationWithCompletionHandler:nil];
        [self setNoHeaderFreshView:NO];
    }else {
        //提示用户无法进行定位操作
    }
    // Do any additional setup after loading the view.
}


- (void)getCurrentLocationWithCompletionHandler:(CLLocation *)handler
{
    _locationHandler = handler;
#if TARGET_IPHONE_SIMULATOR
#else
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
#endif
}


-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"开始定位");
}

-(NSString *)range
{
    if (!_range) {
        _range = @"1000";
    }
    return _range;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    self.locationHandler = currentLocation;
    CLLocationCoordinate2D coor = currentLocation.coordinate;
    //    self.lbllatitude.text =
    

    NSLog(@"%@",[NSString stringWithFormat:@"经度：%3.5f",coor.latitude]);
    self.latitude = [NSString stringWithFormat:@"%3.5f",coor.latitude];
    //    self.lbllongitude.text =
    NSLog(@"%@",[NSString stringWithFormat:@"纬度：%3.5f",coor.longitude]);
    self.longitude =[NSString stringWithFormat:@"%3.5f",coor.longitude];
    //    self.lblaltitude.text =
    NSLog(@"%@",[NSString stringWithFormat:@"高度：%3.5f",currentLocation.altitude]);//高度
    
    [self refreshView];
}

-(void)setNoHeaderFreshView:(BOOL)noHeaderFreshView
{
//    _noHeaderFreshView = noHeaderFreshView;
    if (noHeaderFreshView) {
        [self.tableView removeHeader];
    }
    else
    {
        [self.tableView addHeaderWithTarget:self action:@selector(refreshView)];
    }
}

-(void)refreshView
{
    LOGIN_SESSION * session = [usersigninModel sharedInstance].session;
    if (!session) {
        return;
    }
    // 测试经纬度   38.323222
    //    47.1121222
    [GetNearusersModel getnearusers:session.userid
                           latitude:@"38.323222"
                          longitude:@"47.1121222"
     
                              range:self.range progress:^(REQUEST_TYPE progress) {
                                  if (progress == RELOADING) {
                                      BeeLog(@"正在加载...");
                                  }
                                  else if(progress == FAILED)
                                  {
                                      [self.tableView headerEndRefreshing];
                                      BeeLog(@"加载失败...");
                                  }
                              } getnearusersblock:^(getnearusers *getnearusersblock) {
                                  
                                  [self.tableView headerEndRefreshing];
                                  if(getnearusersblock.Result.ReturnCode.integerValue <= 106)
                                  {
                                      self.dataArray = [NSMutableArray arrayWithArray:getnearusersblock.usergetnearusers];
                                      [self.tableView reloadData];
                                  }
                                  else
                                  {
                                      [self presentMessageTips:getnearusersblock.Result.Message];
                                  }
                              }];
//    [self getCurrentLocationWithCompletionHandler:nil];
//    [self.tableView headerBeginRefreshing];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //    self.lbllatitude.text = [NSString stringWithFormat:@"定位失败"];
    NSLog(@"定位失败");
    [self.tableView headerEndRefreshing];
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
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    A1_NearListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"A1_NearListTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"A1_NearListTableViewCell" owner:self options:nil] lastObject];
    }
    usergetnearusers * anearuser = [self.dataArray objectAtIndex:indexPath.row];
    [cell datachange:anearuser.nickname price:anearuser.priceperday distence:anearuser.distance imageurl:anearuser.userimageurl];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
