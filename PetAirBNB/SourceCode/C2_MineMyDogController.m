//
//  C2_MineMyDogController.m
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C2_MineMyDogController.h"
#import "C2_MineMyDogCell.h"
#import "C3_AddMyDogViewController.h"
#import "C3_DogInfoVewController.h"
#import "GetPetsModel.h"
#import "usersigninModel.h"

@interface C2_MineMyDogController ()

@end

@implementation C2_MineMyDogController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"我的狗狗";
    
    [self FinishedLoadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dogmoreInfo:(id)sender
{
    NSLog(@"domoreinfo...");
    if (sender) {
        petgetpets * apet = (petgetpets *)sender;
        C3_DogInfoVewController * ctr = [[C3_DogInfoVewController alloc] initWithNibName:@"C3_DogInfoVewController" bundle:nil];
        ctr.petid = apet.petid;
        [self.navigationController pushViewController:ctr animated:YES];
    }
    
}

-(void)addOtherDog:(id)sender
{
    C3_AddMyDogViewController * ctr = [[C3_AddMyDogViewController alloc] initWithNibName:@"C3_AddMyDogViewController" bundle:nil];
    [self.navigationController pushViewController:ctr animated:YES];
    
}

#define H_IMAGECELLHEIGHT 80
-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary) {
        
        CELL_STRUCT * cell0_0;
        CELL_STRUCT * cell0_1;
        CELL_STRUCT * cell0_2;
        CELL_STRUCT * cell0_3;
        
        cell0_0 = [[CELL_STRUCT alloc] initWithtitle:@"我的狗狗1" cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:YES sel_selctor:@selector(dogmoreInfo:) delegate:self];
        cell0_0.cellheight = H_IMAGECELLHEIGHT;
        
        cell0_1 = [[CELL_STRUCT alloc] initWithtitle:@"我的狗狗2" cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
        cell0_1.selectionStyle = NO;
        
        cell0_2 = [[CELL_STRUCT alloc] initWithtitle:@"我的狗狗3" cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
        cell0_2.selectionStyle = NO;
        
        cell0_3 = [[CELL_STRUCT alloc] initWithtitle:@"再加一只" cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
        cell0_3.titlecolor = @"gray";
        cell0_3.cellheight = 30;
        cell0_3.sel_selector = @selector(addOtherDog:);
//        NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithObject:cell0_0 forKey:KEY_INDEXPATH(0, 0)];
        
        NSMutableDictionary * array0 =[NSMutableDictionary dictionaryWithObjectsAndKeys:cell0_0,KEY_INDEXPATH(0, 0),cell0_1,KEY_INDEXPATH(0, 1),cell0_2,KEY_INDEXPATH(0, 2),cell0_3,KEY_INDEXPATH(0, 3),nil];
        
        _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0), nil];
    }
    return _dataDictionary;
}

-(void)refreshView
{
    
    [GetPetsModel getpets:[usersigninModel sharedInstance].session.userid progress:^(REQUEST_TYPE progress) {
       
        if (progress == RELOADING) {
            
        }
        else if(progress == FAILED)
        {
            [self FinishedLoadData];
        }
    } getpetsblock:^(getpets *getpetsblock) {
        
        [self FinishedLoadData];
        if (getpetsblock.Result.ReturnCode.integerValue <=106) {
            [self.dataDictionary removeAllObjects];
            if (getpetsblock.petgetpets.count) {
                NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithCapacity:0];
                for (NSInteger index = 0; index < getpetsblock.petgetpets.count; index ++)
                {
                    petgetpets * apet = [getpetsblock.petgetpets objectAtIndex:index];
                    CELL_STRUCT *cell0_index = [[CELL_STRUCT alloc] initWithtitle:apet.petname cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:NO sel_selctor:@selector(dogmoreInfo:) delegate:self];
                    cell0_index.cellheight = H_IMAGECELLHEIGHT;
                    cell0_index.object = apet;
                    [array0 setObject:cell0_index forKey:KEY_INDEXPATH(0, index)];
                    
                }
                if (array0.count) {
                    _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0), nil];
                }
                
                NSMutableDictionary * array1 = [NSMutableDictionary dictionaryWithCapacity:0];
                CELL_STRUCT *cell0_3 = [[CELL_STRUCT alloc] initWithtitle:@"再加一只" cellclass:@"C2_MineMyDogCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
                cell0_3.titlecolor = @"gray";
                cell0_3.cellheight = 30;
                cell0_3.sel_selector = @selector(addOtherDog:);
                [array1 setObject:cell0_3 forKey:KEY_INDEXPATH(1, 0)];
                [_dataDictionary setObject:array1 forKey:KEY_SECTION(1)];
                
                [self.tableView reloadData];
            }

        }
    }];
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
    [cell setcellTitleColor:cellstruct.titlecolor];
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
    if ( cellstruct.sel_selector && [self respondsToSelector:cellstruct.sel_selector])
    {
        
        [self performSelector:cellstruct.sel_selector withObject:cellstruct.object afterDelay:0];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(indexPath.section)];
    CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(indexPath.section, indexPath.row)];
    return cellstruct.cellheight;
}



#pragma mark -

@end
