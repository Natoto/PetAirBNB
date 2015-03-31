//
//  C3_DogInfoVewController.m
//  PetAirBNB
//
//  Created by nonato on 14-12-12.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C3_DogInfoVewController.h"
#import "C3_EditUserInfo_PhotoCell.h"
#import "GetPetsModel.h"
#import "usersigninModel.h"
#import "MJRefresh.h"
#import "C3_DogInfoFldCell.h"
#import "C3_DogInfoOptionCell.h"
#import "C3_DogInfoTxtCell.h"
#import "C3_AddMyDogViewController.h"

@interface C3_DogInfoVewController ()

@end

@implementation C3_DogInfoVewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView addHeaderWithTarget:self action:@selector(refreshview:)];
    [self.tableView headerBeginRefreshing];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)rightButtonTap:(id)sender
{
    C3_AddMyDogViewController * ctr = [[C3_AddMyDogViewController alloc] initWithNibName:@"C3_AddMyDogViewController" bundle:nil];
    NSDictionary * dics0 = [self.dataDictionary objectForKey:KEY_SECTION(0)];
    CELL_STRUCT * cellimages = [dics0 objectForKey:KEY_INDEXPATH(0, 0)];
    
    NSDictionary * dics1 = [self.dataDictionary objectForKey:KEY_SECTION(1)];
    CELL_STRUCT * cellname = [dics1 objectForKey:KEY_INDEXPATH(1, 0)];
    CELL_STRUCT * cellage = [dics1 objectForKey:KEY_INDEXPATH(1, 1)];
    CELL_STRUCT * cellxingge = [dics1 objectForKey:KEY_INDEXPATH(1, 2)];
    
    NSDictionary * dics2 = [self.dataDictionary objectForKey:KEY_SECTION(2)];
//    CELL_STRUCT * cellxingbie = [dics2 objectForKey:KEY_INDEXPATH(2, 0)];
    CELL_STRUCT * celltixing = [dics2 objectForKey:KEY_INDEXPATH(2, 0)];
    CELL_STRUCT * cellyumaogongchu = [dics2 objectForKey:KEY_INDEXPATH(2, 1)];
    CELL_STRUCT * celljieyu = [dics2 objectForKey:KEY_INDEXPATH(2, 0)];
        [ctr datachange:cellimages.array
                   name:cellname.value
                    age:cellage.subvalue1
                  month:cellage.subvalue2
              xinggedes:cellxingge.value
              pingzhong:@"狗狗"
                xingbie:@"1"
                 tixing:celltixing.value
                  jieyu:celljieyu.value
           yumaogongchu:cellyumaogongchu.value
                 yimiao:@"2"];
    
    [self.navigationController pushViewController:ctr animated:YES];
}
-(void)refreshview:(id)sender
{
    [GetPetsModel getapet:[usersigninModel sharedInstance].session.userid petid:self.petid progress:^(REQUEST_TYPE progress) {
        
        if(progress == RELOADING)
        {
            
        }
        else if(progress == FAILED)
        {
            [self.tableView headerEndRefreshing];
        }
    } getpetblock:^(getpet *getpetblock) {
          [self.tableView headerEndRefreshing];
        if (getpetblock.Result.isError)
        {
            [self presentMessageTips:getpetblock.Result.Message];
        }
        else
        {
            [self.dataDictionary removeAllObjects];
            petgetpet * apet = getpetblock.petgetpet;
            CELL_STRUCT * cell0_0;
//            CELL_STRUCT * cell1_0;
//            CELL_STRUCT * cell1_1;
//            CELL_STRUCT * cell1_2;
            cell0_0 = [[CELL_STRUCT alloc] initWithtitle:@"" cellclass:@"C3_EditUserInfo_PhotoCell" placeholder:@"" accessory:YES sel_selctor:@selector(addPhoto:) delegate:self];
            cell0_0.cellheight = H_IMAGECELLHEIGHT;
            NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithObject:cell0_0 forKey:KEY_INDEXPATH(0, 0)];
            
            
            CELL_STRUCT *cell1_0 = [[CELL_STRUCT alloc] initWithtitle:@"姓名" cellclass:@"C3_DogInfoTxtCell" placeholder:@"请输入狗狗姓名" accessory:NO sel_selctor:nil delegate:self];
            cell1_0.value = apet.petname;
            cell1_0.selectionStyle = NO;
            
            CELL_STRUCT *cell1_1 = [[CELL_STRUCT alloc] initWithtitle:@"年龄" cellclass:@"C3_DogInfoTxtCell" placeholder:@"请输入狗狗年龄" accessory:NO sel_selctor:nil delegate:self];
            cell1_1.selectionStyle = NO;
            cell1_1.subvalue1 = [NSString stringWithFormat:@"%@",apet.ageyear];
            cell1_1.subvalue2 = [NSString stringWithFormat:@"%@",apet.agemonth];
            cell1_1.value = [NSString stringWithFormat:@"%@年%@个月",apet.ageyear,apet.agemonth];
            
            CELL_STRUCT * cell1_2 = [[CELL_STRUCT alloc] initWithtitle:@"性格介绍" cellclass:@"C3_DogInfoTxtCell" placeholder:@"请输入狗狗性格介绍" accessory:NO sel_selctor:nil delegate:self];
            cell1_2.selectionStyle = NO;
            cell1_2.cellheight = 200;
            cell1_2.value = apet.description;
            
            NSMutableDictionary * array1 =[NSMutableDictionary dictionaryWithObjectsAndKeys:cell1_0,KEY_INDEXPATH(1, 0),cell1_1,KEY_INDEXPATH(1, 1),cell1_2,KEY_INDEXPATH(1, 2),nil];
            
            CELL_STRUCT *cell2_0 = [[CELL_STRUCT alloc] initWithtitle:@"体型" cellclass:@"C3_DogInfoTxtCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
            cell2_0.selectionStyle = NO;
            cell2_0.value = apet.size;
            
            CELL_STRUCT *cell2_1 = [[CELL_STRUCT alloc] initWithtitle:@"与猫共处" cellclass:@"C3_DogInfoTxtCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
            cell2_1.selectionStyle = NO;
            cell2_1.value = apet.canwithcat?@"可以":@"不可以共处";
            
            CELL_STRUCT *cell2_2 = [[CELL_STRUCT alloc] initWithtitle:@"节育情况" cellclass:@"C3_DogInfoTxtCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
            cell2_2.selectionStyle = NO;
            cell2_2.value = apet.type;
            
            CELL_STRUCT * cell2_3 = [[CELL_STRUCT alloc] initWithtitle:@"疫苗注射"
                                                             cellclass:@"C3_DogInfoOptionCell" placeholder:@""
                                                             accessory:NO sel_selctor:nil
                                                              delegate:self];
            cell2_3.selectionStyle = NO;
            cell2_3.array = [NSMutableArray arrayWithObjects:apet.hasvaccine1,apet.hasvaccine2,apet.hasvaccine3, nil];
            
            NSMutableDictionary * array2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:cell2_0,KEY_INDEXPATH(2, 0),cell2_1,KEY_INDEXPATH(2, 1),cell2_2,KEY_INDEXPATH(2, 2), nil];
           
            _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0),array1,KEY_SECTION(1),array2,KEY_SECTION(2), nil];
            [self.tableView reloadData];
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addPhoto:(id)sender
{
    
}

-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary)
    {
        _dataDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _dataDictionary;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataDictionary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * key = KEY_SECTION(section);
    NSDictionary * array =[self.dataDictionary objectForKey:key];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier01 = [NSString stringWithFormat:@"sec%ld_row%ld",(long)indexPath.section,(long)indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier01];
    
    NSDictionary * dics = [self.dataDictionary objectForKey:KEY_SECTION(indexPath.section)];
    CELL_STRUCT * cellstruct = [dics objectForKey:KEY_INDEXPATH(indexPath.section, indexPath.row)];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellstruct.cellclass owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        cell.indexPath = indexPath;
    }
    cell.selector = cellstruct.sel_selector;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setcellplaceholder:cellstruct.placeHolder];
    [cell setcellTitle:cellstruct.title];
    [cell setcellArray:cellstruct.array];
    [cell setcellValue:cellstruct.value];
    [cell setinputView:cellstruct.inputView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(indexPath.section)];
    CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(indexPath.section, indexPath.row)];
    if (cellstruct.sel_selector) {
        [self performSelector:cellstruct.sel_selector withObject:nil afterDelay:0];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(indexPath.section)];
    CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(indexPath.section, indexPath.row)];
    return cellstruct.cellheight;
}

@end
