//
//  A1_MapViewController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#define MYBUNDLE_NAME @"" //@ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]

#import "A1_MapViewController.h"
#import "GetNearusersModel.h"
#import "BMKPointAnnotation+ICON.h"

@interface A1_MapViewController ()
{
    BMKGroundOverlay * ground;
}
@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,strong) NSMutableArray * pointArray;
@end

@implementation A1_MapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    _locService = [[BMKLocationService alloc]init];
    [followHeadBtn setEnabled:NO];
    [followingBtn setAlpha:0.6];
    [followingBtn setEnabled:NO];
    [followHeadBtn setAlpha:0.6];
    [stopBtn setEnabled:NO];
    [stopBtn setAlpha:0.6];
    
    _mapView.zoomLevel = 15;
    _mapView.showMapScaleBar = YES;
    //自定义比例尺的位置
    _mapView.mapScaleBarPosition = CGPointMake(250,400);

    self.dataArray = [NSMutableArray arrayWithCapacity:1];
    self.pointArray = [NSMutableArray arrayWithCapacity:1];
    
    NSArray * array = [NSMutableArray arrayWithArray:[GetNearusersModel getnearusers]];
    if (array.count) {
        self.dataArray = [NSMutableArray arrayWithArray:array];
    }
}
- (IBAction)addlayer:(id)sender
{
    //用标注代替内置图层
    [_mapView removeAnnotations:self.pointArray];
    if (self.dataArray.count) {
//
        [self.pointArray removeAllObjects];
        for (NSInteger index = 0; index < self.dataArray.count; index ++) {
    
            usergetnearusers * auser = [self.dataArray objectAtIndex:index];
            //BMKPinAnnotationView BMKPointAnnotation
            BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc]init];
            
            CLLocationCoordinate2D coors;
            coors.latitude = auser.latitude.doubleValue;//23.13841;//
            coors.longitude = auser.longitude.doubleValue;//113.31497;//
            pointAnnotation.coordinate = coors;
            pointAnnotation.title = auser.nickname;
            pointAnnotation.subtitle = [NSString stringWithFormat:@"%@元/天",auser.priceperday];
            pointAnnotation.iconurl = auser.userimageurl;
//            [_mapView addAnnotation:pointAnnotation];
            [self.pointArray addObject:pointAnnotation];
        }
        [_mapView addAnnotations:self.pointArray];
    }
}
- (IBAction)removelayer:(id)sender
{
//    [_mapView removeAnnotations:self.pointArray];
    //删除图片图层覆盖物
//    if (ground != nil)
//    {
//        [_mapView removeOverlay:ground];
//        ground=nil;
//    }
}

- (NSString*)getMyBundlePath:(NSString *)filename
{
    
    NSBundle * libBundle = MYBUNDLE ;
    if ( libBundle && filename ){
        NSString * s=[[libBundle resourcePath ] stringByAppendingPathComponent : filename];
                NSLog(@"%@",s);
        return s;
    }
    return nil ;
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
    [self startLocation:nil];
    [self startFollowing:nil];
    
    [self addlayer:nil];
}


-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
  
}
//普通态
-(IBAction)startLocation:(id)sender
{
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
    [startBtn setEnabled:NO];
    [startBtn setAlpha:0.6];
    [stopBtn setEnabled:YES];
    [stopBtn setAlpha:1.0];
    [followHeadBtn setEnabled:YES];
    [followHeadBtn setAlpha:1.0];
    [followingBtn setEnabled:YES];
    [followingBtn setAlpha:1.0];
}
//罗盘态
-(IBAction)startFollowHeading:(id)sender
{
    NSLog(@"进入罗盘态");
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    _mapView.showsUserLocation = YES;
    
}
//跟随态
-(IBAction)startFollowing:(id)sender
{
    NSLog(@"进入跟随态");
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    
}
//停止定位
-(IBAction)stopLocation:(id)sender
{
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
    [stopBtn setEnabled:NO];
    [stopBtn setAlpha:0.6];
    [followHeadBtn setEnabled:NO];
    [followHeadBtn setAlpha:0.6];
    [followingBtn setEnabled:NO];
    [followingBtn setAlpha:0.6];
    [startBtn setEnabled:YES];
    [startBtn setAlpha:1.0];
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}
-(BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKCircle class]])
    {
        BMKCircleView* circleView = [[BMKCircleView alloc] initWithOverlay:overlay] ;
        circleView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        circleView.lineWidth = 5.0;
        return circleView;
    }
    if ([overlay isKindOfClass:[BMKGroundOverlay class]])
    {
        BMKGroundOverlayView* groundView = [[BMKGroundOverlayView alloc] initWithOverlay:overlay] ;
        return groundView;
    }
    return nil;
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        
//        BMKPointAnnotation * pointan = annotation;
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
 
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        newAnnotationView.annotation=annotation;
        ((BMKPinAnnotationView*)newAnnotationView).animatesDrop = YES;
        // 设置可拖拽
        ((BMKPinAnnotationView*)newAnnotationView).draggable = YES;
//        BeeUIImageView * imageview = [[BeeUIImageView alloc] init];
//        [imageview GET:pointan.iconurl useCache:YES];
//        newAnnotationView.image = imageview.image;
        UIImage * image = [[UIImage alloc] initWithContentsOfFile:[self getMyBundlePath:@"dogicon.jpg"]];
        newAnnotationView.image  =  image;
        //[UIImage imageNamed:@"dogicon.png"];   //把大头针换成别的图片
        return newAnnotationView;
        
    }
    return nil;
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
    
}

@end
