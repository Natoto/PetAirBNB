//
//  C0_MineController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-27.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C0_MineController.h"
#import "C0_MineCell.h"
#import "C0_MineProfileView.h"
#import "C1_SignInController.h"
#import "C3_EditUserInfoController.h"
#import "usersigninModel.h"
#import "GetUserModel.h"
#import "SetIshosterModel.h"
#import "C2_MineMyDogController.h"

@interface C0_MineController ()

@property(nonatomic,strong) C0_MineProfileView  * profileView;
@property(nonatomic,strong) UIButton            * exitButton;
//@property(nonatomic,strong) C1_SignInController * signcontroler;
@end

@implementation C0_MineController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.config=[[C0_MineTableViewConfiration alloc] initWithResource:@"C0_MineConfig"];
     LOGIN_SESSION * session = [usersigninModel defaultUser];
    usergetuser * getuser = [GetUserModel usergetuserwithuserid:session.userid];
    [self dataChange:getuser];
    
    
}


-(void)dataChange:(usergetuser *)getuser
{
    if (!getuser.userid) {
        return;
    }
//    usergetuser * getuser = block.usergetuser;
    NSString * address = [NSString stringWithFormat:@"%@ %@%@ %@",getuser.province,getuser.city,getuser.district,getuser.address];
    if (self.profileView) {
        [self.profileView dataChange:getuser.userimageid
                                name:getuser.nickname
                             address:address
                     profiletapblock:^{
                         
                     } cellTapblock:^{
                         C3_EditUserInfoController * signcontroler = [[C3_EditUserInfoController alloc] initWithNibName:@"C3_EditUserInfoController" bundle:nil];
                         signcontroler.hidesBottomBarWhenPushed = YES;
                         [self.navigationController pushViewController:signcontroler animated:YES];
                     }];
    }
    //我的狗狗
    [self.config setValue:getuser.userpetcount key:@"value" indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    NSNumber * ishoster = getuser.ishoster;
    //是否提供寄养服务
    [self.config setValue:getuser.ishoster key:@"value" indexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
//    if (ishoster.boolValue) {
    
        //寄养价格
        NSString * priceperday = [NSString stringWithFormat:@"%@元/天",getuser.priceperday];
        [self.config setValue:priceperday key:@"detail" indexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        
        //养宠经验
        NSString * exprence = [NSString stringWithFormat:@"%@年%@月",getuser.hostyear,getuser.hostmonth];
        [self.config setValue:exprence key:@"detail"  indexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        //住宅类型
        [self.config setValue:getuser.housetype key:@"detail" indexPath:[NSIndexPath indexPathForRow:2 inSection:1]];
        //宠物室外活动范围
        [self.config setValue:getuser.outsidetype key:@"detail" indexPath:[NSIndexPath indexPathForRow:3 inSection:1]];
        [self.tableView reloadData];
}

-(void)refreshView
{
    LOGIN_SESSION * session = [usersigninModel defaultUser];
    if (!session) {
        [self FinishedLoadData];
        C1_SignInController * signcontroler = [[C1_SignInController alloc] initWithNibName:@"C1_SignInController" bundle:nil];
        signcontroler.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:signcontroler animated:YES];
        return;
    }
    [GetUserModel usergetprofile:session.userid progress:^(REQUEST_TYPE progress) {
        if (progress == RELOADING) {
//            [self presentLoadingTips:@"获得个人信息"];
        }
        else if(progress == FAILED)
        {
            [self presentMessageTips:@"获得个人信息失败，请重试！"];
//            [self dismissTips];
            [self FinishedLoadData];
        }
    } usergetuserblock:^(GetUser *block)
    {
         if (block.Result.ReturnCode.integerValue <= 106)
         {
             if (block.usergetuser.userid) {
            [self dataChange:block.usergetuser];
            [self FinishedLoadData];
       
             }
        [self dismissTips];
         }
       
        
    }];
}


-(C0_MineProfileView *)profileView
{
    if (!_profileView) {
        _profileView = [[[NSBundle mainBundle] loadNibNamed:@"C0_MineProfileView" owner:self options:nil] lastObject];
    }
    return _profileView;
}

//-(C1_SignInController *)signcontroler
//{
//    if (!_signcontroler) {
//        _signcontroler = [[C1_SignInController alloc] initWithNibName:@"C1_SignInController" bundle:nil];
//    }
//    return _signcontroler;
//}



-(void)viewDidAppear:(BOOL)animated
{ 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)exitButtonTap:(id)sender
{
    BeeLog(@"退出账户");
    C1_SignInController * signcontroler = [[C1_SignInController alloc] initWithNibName:@"C1_SignInController" bundle:nil];
    [self.navigationController pushViewController:signcontroler animated:YES];
    
}

-(UIButton *)exitButton
{
    if (!_exitButton) {
        _exitButton = [ToolsFunc CreateButtonWithFrame:CGRectMake(5, 10, CGRectGetWidth([UIScreen mainScreen].bounds) - 10, 40) andTxt:@"退出账户"];
        [_exitButton setBackgroundColor:[UIColor colorWithRed:166./255. green:44./255. blue:49./255. alpha:1]];
        KT_CORNER_RADIUS(_exitButton, 20);
        [_exitButton addTarget:self action:@selector(exitButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
//    return 1;
    return [self.config numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
     return [self.config numberOfRowsInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (!section) {
        return 100;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == ([self.config numberOfSections] -1)) {
        return 70;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (!section) {
       
        return self.profileView;
    }
    return nil;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == ([self.config numberOfSections] -1)) {
        UIView * view = [[UIView alloc]init];
        [view addSubview:self.exitButton];
        return view;
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellClassname=[self.config cellClassnameForIndexPath:indexPath];
    C0_MineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClassname];
    //    C0_MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"C0_MineCell"];
    if (!cell) {
        NSLog(@"----------%@",cellClassname);
        //        Class cellClass=NSClassFromString(cellClassname);
        cell = [[[NSBundle mainBundle] loadNibNamed:cellClassname owner:self options:nil] lastObject];
    }
    cell.TitleLabel.text = [self.config labelForIndexPath:indexPath];
    cell.DetailLabel.text = [self.config detailForIndexPath:indexPath];
    NSString * value = [self.config valueForIndexPath:indexPath];
    if (value && (([[value class] isSubclassOfClass:[NSString class]] && value.length) || ([[value class] isSubclassOfClass:[NSNumber class]] && value.integerValue)))
    {
        cell.TitleLabel.text = [NSString stringWithFormat:@"%@(%@)",[self.config labelForIndexPath:indexPath],[self.config valueForIndexPath:indexPath]];
    }
    cell.accessoryType = [self.config accessoryDetailForIndexPath:indexPath]?UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    C0_MineCell * cell = (C0_MineCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    NSString * action = [self.config actionForIndexPath:indexPath];
    NSLog(@"%@",action);
    SEL selector = NSSelectorFromString(action);
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector withObject:cell afterDelay:0.1f];
    }
}


// ------------------  华丽丽的分割线  -----------------------
//我的狗狗
-(void)mydogcelltap:(id)sender
{
    C2_MineMyDogController * ctr = [[C2_MineMyDogController alloc] initWithNibName:@"C2_MineMyDogController" bundle:nil];
    [self.navigationController pushViewController:ctr animated:YES];
}
//我的预定
-(void)myprecelltap:(id)sender
{
    
}

//收藏宠屋

-(void)mycollectcelltap:(id)sender
{
    
}


//头衔
-(void)mytitlecelltap:(id)sender
{
    
}


//是否提供寄养
-(void)myairbnbservicecelltap:(id)sender
{
    
}
// -----------------------------------------------------
//价格
-(void)bnbpricecelltap:(id)sender
{
    
}

//住宅类型
-(void)bnbhousettypecelltap:(id)sender
{
    
}

// 宠物室外活动范围
-(void)bnbouthousecelltap:(id)sender
{
    
}
//空闲日程
-(void)bnbfreedatecelltap:(id)sender
{
    
}
//养宠经验
-(void)bnbjingyancelltap:(id)sender
{
    
}




@end
