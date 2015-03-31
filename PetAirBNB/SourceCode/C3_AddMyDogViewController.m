//
//  C3_AddMyDogViewController.m
//  PetAirBNB
//
//  Created by nonato on 14-12-10.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C3_AddMyDogViewController.h"
#import "C3_EditUserInfo_PhotoCell.h"
#import "C3_EditUserInfo_EditCell.h"
#import "C3_AddMyDog_OptionCell.h"

@interface C3_AddMyDogViewController ()<C3_EditUserInfo_EditCellDelegate>
@property (weak, nonatomic) IBOutlet UIButton *savebtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation C3_AddMyDogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addPhoto:(id)sender
{
    
}

-(void)datachange:(NSMutableArray *)imagearray
             name:(NSString *)name
              age:(NSString *)age
            month:(NSString *)month
        xinggedes:(NSString *)xinggedes
        pingzhong:(NSString *)pingzhong
          xingbie:(NSString *)xingbie
           tixing:(NSString *)tixing
            jieyu:(NSString *)jieyu
     yumaogongchu:(NSString *)yumaogongchu
           yimiao:(NSString *)yimiao
{
    [self.dataDictionary removeAllObjects];
    CELL_STRUCT * cell0_0;
    CELL_STRUCT * cell1_0;
    CELL_STRUCT * cell1_1;
    CELL_STRUCT * cell1_2;
    
    cell0_0 = [[CELL_STRUCT alloc] initWithtitle:@"添加照片" cellclass:@"C3_EditUserInfo_PhotoCell" placeholder:@"" accessory:YES sel_selctor:@selector(addPhoto:) delegate:self];
    cell0_0.cellheight = H_IMAGECELLHEIGHT;
    cell0_0.array =  imagearray;
    
    cell1_0 = [[CELL_STRUCT alloc] initWithtitle:@"姓名" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗姓名" accessory:NO sel_selctor:nil delegate:self];
    cell1_0.selectionStyle = NO;
    cell1_0.value = name;
    
    cell1_1 = [[CELL_STRUCT alloc] initWithtitle:@"年龄" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗年龄" accessory:NO sel_selctor:nil delegate:self];
    cell1_1.selectionStyle = NO;
    cell1_1.value = age;
    
    cell1_2 = [[CELL_STRUCT alloc] initWithtitle:@"品种" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗品种" accessory:NO sel_selctor:nil delegate:self];
    cell1_2.selectionStyle = NO;
    cell1_2.value = pingzhong;
    
    CELL_STRUCT * cell2_0 = [[CELL_STRUCT alloc] init];
    CELL_STRUCT * cell3_0 = [[CELL_STRUCT alloc] init];
    CELL_STRUCT * cell4_0 = [[CELL_STRUCT alloc] init];
    CELL_STRUCT * cell5_0 = [[CELL_STRUCT alloc] init];
    CELL_STRUCT * cell6_0 = [[CELL_STRUCT alloc] init];
    
    NSMutableArray * cellary = [NSMutableArray arrayWithObjects:cell2_0,cell3_0,cell4_0,cell5_0,cell6_0, nil];
    NSArray * titles =[NSArray arrayWithObjects:@"性别",@"体型",@"节育",@"与猫共处",@"疫苗", nil];
    NSArray * xingbies=@[@"男",@"女"];
    NSArray * tixings = @[@"小型犬",@"中型犬",@"大型犬"];
    NSArray * jieyus = @[@"已绝育",@"未绝育"];
    NSArray * yumaogongchus = @[@"可以",@"不可以"];
    NSArray * yimiaos = @[@"疫苗1",@"疫苗2",@"疫苗3"];
    NSArray * sectionvalues = @[xingbies,tixings,jieyus,yumaogongchus,yimiaos];
    NSArray * sectionOptionvalues = @[xingbie,tixing,jieyu,yumaogongchu,yimiao];
    for (NSInteger index = 0; index < cellary.count; index ++) {
        NSString * title = [titles objectAtIndex:index];
        CELL_STRUCT * cell = [cellary objectAtIndex:index];
        cell = [[CELL_STRUCT alloc] initWithtitle:title cellclass:@"C3_AddMyDog_OptionCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
        cell.sectionheight = 30;
        cell.sectiontitle = title;
        cell.value = [sectionOptionvalues objectAtIndex:index];
        cell.array = [sectionvalues objectAtIndex:index];
        [cellary setObject:cell atIndexedSubscript:index];
    }
    
    CELL_STRUCT * cell7_0 = [[CELL_STRUCT alloc] initWithtitle:@"性格介绍" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗性格介绍" accessory:NO sel_selctor:nil delegate:self];
    cell7_0.selectionStyle = NO;
    cell7_0.cellheight = 200;
    
    NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithObject:cell0_0 forKey:KEY_INDEXPATH(0, 0)];
    
    NSMutableDictionary * array1 =[NSMutableDictionary dictionaryWithObjectsAndKeys:cell1_0,KEY_INDEXPATH(1, 0),cell1_1,KEY_INDEXPATH(1, 1),cell1_2,KEY_INDEXPATH(1, 2),nil];
    
    NSMutableDictionary * array2 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:0] forKey:KEY_INDEXPATH(2, 0)];
    
    NSMutableDictionary * array3 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:1] forKey:KEY_INDEXPATH(3, 0)];
    
    NSMutableDictionary * array4 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:2] forKey:KEY_INDEXPATH(4, 0)];
    
    NSMutableDictionary * array5 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:3] forKey:KEY_INDEXPATH(5, 0)];
    
    NSMutableDictionary * array6 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:4] forKey:KEY_INDEXPATH(6, 0)];
    
    NSMutableDictionary * array7 = [NSMutableDictionary dictionaryWithObject:cell7_0 forKey:KEY_INDEXPATH(7, 0)];
    _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0),array1,KEY_SECTION(1),array2,KEY_SECTION(2),array3,KEY_SECTION(3),array4,KEY_SECTION(4),array5,KEY_SECTION(5),array6,KEY_SECTION(6),array7,KEY_SECTION(7), nil];
    [self.tableView reloadData];
}

-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary) {
        
        CELL_STRUCT * cell0_0;
        CELL_STRUCT * cell1_0;
        CELL_STRUCT * cell1_1;
        CELL_STRUCT * cell1_2;
        
        cell0_0 = [[CELL_STRUCT alloc] initWithtitle:@"添加照片" cellclass:@"C3_EditUserInfo_PhotoCell" placeholder:@"" accessory:YES sel_selctor:@selector(addPhoto:) delegate:self];
        cell0_0.cellheight = H_IMAGECELLHEIGHT;
        
        cell1_0 = [[CELL_STRUCT alloc] initWithtitle:@"姓名" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗姓名" accessory:NO sel_selctor:nil delegate:self];
        cell1_0.selectionStyle = NO;
        
        cell1_1 = [[CELL_STRUCT alloc] initWithtitle:@"年龄" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗年龄" accessory:NO sel_selctor:nil delegate:self];
        cell1_1.selectionStyle = NO;
        
        cell1_2 = [[CELL_STRUCT alloc] initWithtitle:@"品种" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗品种" accessory:NO sel_selctor:nil delegate:self];
        cell1_2.selectionStyle = NO;
        
        CELL_STRUCT * cell2_0 = [[CELL_STRUCT alloc] init];
        CELL_STRUCT * cell3_0 = [[CELL_STRUCT alloc] init];
        CELL_STRUCT * cell4_0 = [[CELL_STRUCT alloc] init];
        CELL_STRUCT * cell5_0 = [[CELL_STRUCT alloc] init];
        CELL_STRUCT * cell6_0 = [[CELL_STRUCT alloc] init];
        
        NSMutableArray * cellary = [NSMutableArray arrayWithObjects:cell2_0,cell3_0,cell4_0,cell5_0,cell6_0, nil];
        NSArray * titles =[NSArray arrayWithObjects:@"性别",@"体型",@"节育",@"与猫共处",@"疫苗", nil];
        NSArray * xingbies=@[@"男",@"女"];
        NSArray * tixings = @[@"小型犬",@"中型犬",@"大型犬"];
        NSArray * jieyus = @[@"已绝育",@"未绝育"];
        NSArray * yumaogongchus = @[@"可以",@"不可以"];
        NSArray * yimiaos = @[@"疫苗1",@"疫苗2",@"疫苗3"];
        NSArray * sectionvalues = @[xingbies,tixings,jieyus,yumaogongchus,yimiaos];
        for (NSInteger index = 0; index < cellary.count; index ++) {
            NSString * title = [titles objectAtIndex:index];
            CELL_STRUCT * cell = [cellary objectAtIndex:index];
             cell = [[CELL_STRUCT alloc] initWithtitle:title cellclass:@"C3_AddMyDog_OptionCell" placeholder:@"" accessory:NO sel_selctor:nil delegate:self];
            cell.sectionheight = 30;
            cell.sectiontitle = title;
            
            cell.array = [sectionvalues objectAtIndex:index];
            [cellary setObject:cell atIndexedSubscript:index];
        }
        
        CELL_STRUCT * cell7_0 = [[CELL_STRUCT alloc] initWithtitle:@"性格介绍" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入狗狗性格介绍" accessory:NO sel_selctor:nil delegate:self];
        cell7_0.selectionStyle = NO;
        cell7_0.cellheight = 200;
        
        NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithObject:cell0_0 forKey:KEY_INDEXPATH(0, 0)];
        
        NSMutableDictionary * array1 =[NSMutableDictionary dictionaryWithObjectsAndKeys:cell1_0,KEY_INDEXPATH(1, 0),cell1_1,KEY_INDEXPATH(1, 1),cell1_2,KEY_INDEXPATH(1, 2),nil];
        
        NSMutableDictionary * array2 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:0] forKey:KEY_INDEXPATH(2, 0)];
        
        NSMutableDictionary * array3 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:1] forKey:KEY_INDEXPATH(3, 0)];
        
        NSMutableDictionary * array4 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:2] forKey:KEY_INDEXPATH(4, 0)];
        
        NSMutableDictionary * array5 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:3] forKey:KEY_INDEXPATH(5, 0)];
        
        NSMutableDictionary * array6 = [NSMutableDictionary dictionaryWithObject:[cellary objectAtIndex:4] forKey:KEY_INDEXPATH(6, 0)];
        
        NSMutableDictionary * array7 = [NSMutableDictionary dictionaryWithObject:cell7_0 forKey:KEY_INDEXPATH(7, 0)];
        _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0),array1,KEY_SECTION(1),array2,KEY_SECTION(2),array3,KEY_SECTION(3),array4,KEY_SECTION(4),array5,KEY_SECTION(5),array6,KEY_SECTION(6),array7,KEY_SECTION(7), nil];
    }
    return _dataDictionary;
}

#pragma mark - c3_edit user info delegate
-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldDidBeginEditing:(UITextField *)textField
{
//    self.cur_indexPath = cell.indexPath;
    CGRect rect = [self.tableView rectForRowAtIndexPath:cell.indexPath];
    [self.tableView setContentOffset:CGPointMake(0, rect.origin.y) animated:YES];
}

-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldDidEndEditing:(UITextField *)textField
{
    NSDictionary * dics = [self.dataDictionary objectForKey:KEY_SECTION(1)];
    CELL_STRUCT * cellstruct = [dics objectForKey:KEY_INDEXPATH(cell.indexPath.section, cell.indexPath.row)];
    cellstruct.value = textField.text;
    [self.dataDictionary setObject:dics forKey:KEY_SECTION(1)];
    
}
-(BOOL)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldShouldReturn:(UITextField *)textField
{
//    self.cur_indexPath = cell.indexPath;
    if (cell.indexPath.row < 3) {
        NSIndexPath * indexpath =[NSIndexPath indexPathForRow:cell.indexPath.row + 1 inSection:cell.indexPath.section];
        C3_EditUserInfo_EditCell * cell2 = (C3_EditUserInfo_EditCell *)[self.tableView cellForRowAtIndexPath:indexpath];
        if (cell2) {
            [cell2 becomeFirstResponder];
        }
        else
        {
            [cell resignFirstResponder];
        }
    }
    else
    {
        [cell resignFirstResponder];
//        [self saveButtonTap:nil];
    }
    return YES;
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
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(section)];
    CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(section, 0)];
    if (cellstruct.sectionheight) {
        return cellstruct.sectionheight;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(section)];
    CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(section, 0)];
    if (cellstruct.sectiontitle.length) {
        return cellstruct.sectiontitle;
    }
    return nil;
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
