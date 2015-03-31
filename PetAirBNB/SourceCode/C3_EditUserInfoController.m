//
//  C3_EditUserInfoController.m
//  PetAirbnb
//
//  Created by nonato on 14-12-1.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "BaseTableViewCell.h"
#import "C3_EditUserInfo_PhotoCell.h"
#import "C3_EditUserInfo_EditCell.h"

#import "C3_EditUserInfoController.h"
#import "HBImagePickerControllerEx.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "LXActionSheet.h"
#import "GetProfileModel.h"
#import "usersigninModel.h"
#import "MJRefresh.h"
#import "UpdateProfileModel.h" 

#import "Bee_UITipsView+Block.h"
#import "B4_PreviewImageView+NetWork.h"


@interface C3_EditUserInfoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,LXActionSheetDelegate,C3_EditUserInfo_EditCellDelegate>

@property(nonatomic,strong)       BeeUITipsView * Tipsview;
@property(nonatomic,strong) B4_PreviewImageView * previewView;
@property(nonatomic,weak) IBOutlet UIButton     * saveButton;
@property(nonatomic,strong) NSIndexPath         * cur_indexPath;


@end

@implementation C3_EditUserInfoController


-(NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary) {
        
        CELL_STRUCT * cell0_0;
        CELL_STRUCT * cell1_0;
        CELL_STRUCT * cell1_1;
        CELL_STRUCT * cell1_2;
        CELL_STRUCT * cell1_3;
        
        cell0_0 = [[CELL_STRUCT alloc] initWithtitle:@"添加照片" cellclass:@"C3_EditUserInfo_PhotoCell" placeholder:@"" accessory:YES sel_selctor:@selector(addPhoto:) delegate:self];
        cell0_0.cellheight = H_IMAGECELLHEIGHT;
        
        cell1_0 = [[CELL_STRUCT alloc] initWithtitle:@"昵称" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入昵称" accessory:NO sel_selctor:nil delegate:self];
        cell1_0.selectionStyle = NO;
        
        cell1_1 = [[CELL_STRUCT alloc] initWithtitle:@"地址" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入地址" accessory:NO sel_selctor:nil delegate:self];
        cell1_1.selectionStyle = NO;
        cell1_1.inputView = @"HZAreaPickerView";
        
        cell1_2 = [[CELL_STRUCT alloc] initWithtitle:@"详细地址" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入详细地址" accessory:NO sel_selctor:nil delegate:self];
        cell1_2.selectionStyle = NO;
        
        cell1_3 = [[CELL_STRUCT alloc] initWithtitle:@"简介" cellclass:@"C3_EditUserInfo_EditCell" placeholder:@"请输入简介" accessory:NO sel_selctor:nil delegate:self];
        cell1_3.selectionStyle = NO;
        cell1_3.cellheight = 100;
        
        NSMutableDictionary * array0 = [NSMutableDictionary dictionaryWithObject:cell0_0 forKey:KEY_INDEXPATH(0, 0)];
        
        NSMutableDictionary * array1 =[NSMutableDictionary dictionaryWithObjectsAndKeys:cell1_0,KEY_INDEXPATH(1, 0),cell1_1,KEY_INDEXPATH(1, 1),cell1_2,KEY_INDEXPATH(1, 2),cell1_3,KEY_INDEXPATH(1, 3),nil];
        
        _dataDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array0,KEY_SECTION(0),array1,KEY_SECTION(1), nil];
    }
    return _dataDictionary;
}

-(BeeUITipsView *)Tipsview
{
    if (!_Tipsview) {
        _Tipsview = [[BeeUITipsView alloc] init];
    }
    return _Tipsview;
}
-(IBAction)addPhoto:(id)sender
{
    if ([[sender class] isSubclassOfClass:[UIButton class]]) {
        LXActionSheet *sheet;
        // 判断是否支持相机
        if([HBImagePickerControllerEx isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            sheet  = [[LXActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"拍照",@"从手机相册选择"]];
        }else {
            sheet = [[LXActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"从手机相册选择"]];
        }
        sheet.tag = 255;
        [sheet showInView:self.view];
        [self.view bringSubviewToFront:sheet];
    }
    else if([[sender class] isSubclassOfClass:[UITapGestureRecognizer class]])//预览图片
    {
        if (self.previewView) {
            NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(0)];
            CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(0, 0)];
            if (!cellstruct.array.count) {
                return;
            }
            [self.previewView showInView:self.view
                              currenturl:nil index:0
                                    urls:cellstruct.array
                              shownblock:^(BOOL result){
                                  
                [self.navigationController setNavigationBarHidden:YES animated:YES];
                [[UIApplication sharedApplication] setStatusBarHidden:YES];
                [self setNeedsStatusBarAppearanceUpdate];
                BeeLog(@"----preview 添加");}
             
                             tappedblock:^(NSArray  *result){
                                 
                cellstruct.array =[NSMutableArray arrayWithArray:result];
                [self.dataDictionary setObject:dic forKey:KEY_SECTION(0)];
                
                [self.navigationController setNavigationBarHidden:NO animated:YES];
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                [self setNeedsStatusBarAppearanceUpdate];
                
                [self.previewView removeFromSuperview];
                [self.tableView reloadData];
                BeeLog(@"--preview 消失");
            }
                             deleteblock:^(NSInteger block) {
               
                                 BeeLog(@"删除 %d",block);
            }];
        }
    }
}

#pragma mark - 预览照片
-(B4_PreviewImageView *)previewView
{
    CGRect frame =[UIScreen mainScreen].bounds;
    if (!_previewView) {
        _previewView =[[B4_PreviewImageView alloc] initWithFrame:CGRectZero];
    }
    _previewView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    return _previewView;
}

-(void)selectFromAblum{
    
    HBImagePickerControllerEx *m_imagePicker = [[HBImagePickerControllerEx alloc] init];
    [m_imagePicker setDelegate:self];
    [m_imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [m_imagePicker setAllowsEditing:NO];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [self presentViewController:m_imagePicker animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"编辑个人信息";
//     [self showBarButton:BeeUINavigationBar.RIGHT  title:__TEXT(@"confirm")];
    //push的时候隐藏tabbar
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self previewView];
    [self.saveButton setBackgroundColor:[UIColor colorWithRed:105./255. green:61./255. blue:36./255. alpha:1]];
    KT_CORNER_RADIUS(self.saveButton, 20);
    
     self.navigationBarRight = self.editButtonItem;
    [self.tableView addHeaderWithTarget:self action:@selector(refreshView)];
    
    LOGIN_SESSION * session = [usersigninModel sharedInstance].session;
    if (session) {
        usergetprofile * profile = [GetProfileModel usergetprofilewithuserid:session.userid];
        [self  dataChange:profile];
    }
    [self refreshView];    
}

-(void)refreshView
{
    LOGIN_SESSION * session = [usersigninModel sharedInstance].session;
    [GetProfileModel usergetprofile:session.userid
                           progress:^(REQUEST_TYPE progress) {
        if (progress == FAILED) {
            self.Tipsview = [self presentMessageTips:@"请求失败"];
            [self.tableView headerEndRefreshing];
        }
    }
                    getprofileblock:^(GetProfile *block)
     {
        if (block.Result.ReturnCode) {
            [self dataChange:block.usergetprofile];
        }
        [self.tableView headerEndRefreshing];
    }];
}

-(void)dataChange:(usergetprofile *)profile
{
    if (!profile.profile.userid) {
        return;
    }
    //图片
    NSDictionary * section0 = [self.dataDictionary objectForKey:KEY_SECTION(0)];
    CELL_STRUCT * cellstruct = [section0 objectForKey:KEY_INDEXPATH(0, 0)];
    if (profile.images.count) {
        NSMutableArray * imageurlary = [[NSMutableArray alloc] initWithCapacity:0];
        for (images * aimages in profile.images) {
            [imageurlary addObject:aimages.imageurl];
        }
        cellstruct.array = [NSMutableArray arrayWithArray:imageurlary];
        [self.dataDictionary setObject:section0 forKey:KEY_SECTION(0)];
    }
    
    //昵称
    NSDictionary * section1 = [self.dataDictionary objectForKey:KEY_SECTION(1)];
    CELL_STRUCT * cellstruct01 = [section1 objectForKey:KEY_INDEXPATH(1, 0)];
    cellstruct01.value = [NSString stringWithFormat:@"%@",profile.profile.nickname];
    // 地址
    CELL_STRUCT * cellstruct11 = [section1 objectForKey:KEY_INDEXPATH(1, 1)];
    cellstruct11.value = [NSString stringWithFormat:@"%@ %@ %@",profile.profile.province,profile.profile.city,profile.profile.district];
   //详细地址
    CELL_STRUCT * cellstruct21 = [section1 objectForKey:KEY_INDEXPATH(1, 2)];
    cellstruct21.value = [NSString stringWithFormat:@"%@",profile.profile.address];
    //简介
    CELL_STRUCT * cellstruct31 = [section1 objectForKey:KEY_INDEXPATH(1, 3)];
    cellstruct31.value = [NSString stringWithFormat:@"%@",profile.profile.userdescription];
    
    [self.dataDictionary setObject:section1 forKey:KEY_SECTION(1)];
    [self.tableView reloadData];
}

#pragma mark - C3_EditUserInfo_EditCell Delegate 

/*
 * 计算偏移位置不使键盘挡住输入框
 */
-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldDidBeginEditing:(UITextField *)textField
{
    self.cur_indexPath = cell.indexPath;
    
    CGRect rect = [self.tableView rectForRowAtIndexPath:cell.indexPath];
    [self.tableView setContentOffset:CGPointMake(0, rect.origin.y) animated:YES];
    
}
//
//if (cell.indexPath == [NSIndexPath indexPathForRow:0 inSection:1]) {
//    
//}
//下一项
-(BOOL)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell textFieldShouldReturn:(UITextField *)textField
{
    self.cur_indexPath = cell.indexPath;
    if (cell.indexPath.row < 3) {
        NSIndexPath * indexpath =[NSIndexPath indexPathForRow:cell.indexPath.row + 1 inSection:cell.indexPath.section];
        C3_EditUserInfo_EditCell * cell = (C3_EditUserInfo_EditCell *)[self.tableView cellForRowAtIndexPath:indexpath];
        [cell becomeFirstResponder];
    }
    else
    {
        [self saveButtonTap:nil];
    }    
    return YES;
}

-(void)C3_EditUserInfo_EditCell:(C3_EditUserInfo_EditCell *)cell  textFieldDidEndEditing:(UITextField *)textField
{
    self.cur_indexPath = cell.indexPath;
    BeeLog(@"%@",textField.text);
    NSDictionary * dics = [self.dataDictionary objectForKey:KEY_SECTION(1)];
    CELL_STRUCT * cellstruct = [dics objectForKey:KEY_INDEXPATH(cell.indexPath.section, cell.indexPath.row)];
    cellstruct.value = textField.text;
    [self.dataDictionary setObject:dics forKey:KEY_SECTION(1)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 保存。。。

-(IBAction)saveButtonTap:(id)sender
{
    BeeLog(@"保存。。。");
    NSString * userid = [usersigninModel sharedInstance].session.userid;
    NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(1)];
    CELL_STRUCT *cell01  = [dic objectForKey:KEY_INDEXPATH(1, 0)];
    CELL_STRUCT *cell11  = [dic objectForKey:KEY_INDEXPATH(1, 1)];
    CELL_STRUCT *cell21  = [dic objectForKey:KEY_INDEXPATH(1, 2)];
    CELL_STRUCT *cell31  = [dic objectForKey:KEY_INDEXPATH(1, 3)];
    NSArray * addrary = [cell11.value.trim componentsSeparatedByString:@" "];
    NSString * provice = nil;
    NSString * city = nil;
    NSString * district = nil;
    if (addrary.count == 3) {
        provice = [addrary objectAtIndex:0];
        city = [addrary objectAtIndex:1];
        district =[addrary objectAtIndex:2];
    }
    else//直辖市省份和市一样
    {
        city = [addrary objectAtIndex:0];
        district =[addrary objectAtIndex:1];
        provice = [addrary objectAtIndex:0];
    }
    [UpdateProfileModel updateprofile:userid
                             nickname:cell01.value
                              country:nil
                             province:provice
                                 city:city
                             district:district
                              address:cell21.value
                      userdescription:cell31.value
                             progress:^(REQUEST_TYPE progress) {
                                
                                 if (progress == FAILED) {
                                     [self dismissTips];
                                     self.Tipsview = [self presentMessageTips:@"请求失败"];
                                     
                                 }
                                 else if (progress == RELOADING)
                                 {
                                     [self presentLoadingTips:@"正在保存..."];
                                 }
                             }
                   updateprofileblock:^(UpdateProfile *block) {
                       [self presentMessageTips:block.Result.Message dimissblock:^(id block)
                       {
                           if (block) {
                               [self.navigationController popToRootViewControllerAnimated:YES];
                           }
                       }];
                       
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



#pragma mark  - 处理图片选择
-(void)didClickOnButtonIndex:(NSInteger)buttonIndex
{
    
    NSUInteger sourceType = 0;
    // 判断是否支持相机
    if([HBImagePickerControllerEx isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 2:
                // 取消
                return;
            case 0:
                // 相机
            {
                sourceType = UIImagePickerControllerSourceTypeCamera;
                [self performSelector:@selector(showcamera) withObject:nil afterDelay:0.1];
                break;
            }
            case 1:
                // 相册
            {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self selectFromAblum];
            }
        }
    }
    else {
        if (buttonIndex == 1) {
            return;
        } else {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [self selectFromAblum];
        }
    }
}
#pragma mark - 打开相机
- (void)showcamera
{
    UIImagePickerController *m_imagePicker = [[UIImagePickerController alloc] init];
    [m_imagePicker setDelegate:self];
    [m_imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [m_imagePicker setAllowsEditing:NO];
    [self presentViewController:m_imagePicker animated:YES completion:nil];
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        
        if ([mediaType isEqualToString:@"public.image"]){
            [self handleCanmearInfo:info];
        }
    }
    else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
    {
        [self handleAblumInfo:info];
    }
}

-(void)handleCanmearInfo:(NSDictionary *)info
{
    NSData *data;
    //切忌不可直接使用originImage，因为这是没有经过格式化的图片数据，可能会导致选择的图片颠倒或是失真等现象的发生，从UIImagePickerControllerOriginalImage中的Origin可以看出，很原始，哈哈
    UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //图片压缩，因为原图都是很大的，不必要传原图
    float scalerat = 0.5; //[C0_HairPostAddPhotoCell uploadPhotoMode]==UPLPHOTOMODE_HIGH?1:0.5;
    self.Tipsview = [self presentLoadingTips:@"处理中..."];
    UIImage *scaleImage = [HBImagePickerControllerEx scaleImage:originImage toScale:scalerat];
    
    //以下这两步都是比较耗时的操作，最好开一个HUD提示用户，这样体验会好些，不至于阻塞界面
    
    NSInteger uploadPhotoMode = 0;
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",[[NSDate date] stringWithDateFormat:@"yyyy_MM_dd_HH_MM_SS"]];
    if (UIImagePNGRepresentation(scaleImage) == nil) {
        //将图片转换为JPG格式的二进制数据
        data = UIImageJPEGRepresentation(scaleImage, 1);
        fileName = [NSString stringWithFormat:@"ios_dz%dp_%@.jpg",uploadPhotoMode,[[NSDate date] stringWithDateFormat:@"yyyy_MM_dd_HH_MM_SS"]];
    } else {
        //将图片转换为PNG格式的二进制数据
        data = UIImagePNGRepresentation(scaleImage);
        fileName = [NSString stringWithFormat:@"ios_dz%dp_%@.png",uploadPhotoMode,[[NSDate date] stringWithDateFormat:@"yyyy_MM_dd_HH_MM_SS"]];
    } //        //将二进制数据生成UIImage
    UIImage *image = [UIImage imageWithData:data];
    
    UIImageWriteToSavedPhotosAlbum(image, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [self uploadImages:data];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [[UINavigationBar appearance] setTintColor:CLR_FOREGROUND];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        [self dismissTips];
        [self.tableView reloadData];
    }];

    
}

-(void)handleAblumInfo:(NSDictionary *)info
{
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        ALAssetRepresentation *representation = [myasset defaultRepresentation];
        // .fullScreenImage];
        //        image = [image fixOrientation:image];//旋转方向
        /*
         //获取资源图片的高清图
         [representation fullResolutionImage];
         //获取资源图片的全屏图
         [representation fullScreenImage];
         //获取资源图片的名字
         */
        [self presentLoadingTips:@"处理中..."];
        CGImageRef iref = [representation fullScreenImage];//
        float scalerat = 0.5;
//        NSInteger uploadPhotoMode = 0;
        //[C0_HairPostAddPhotoCell uploadPhotoMode]==UPLPHOTOMODE_HIGH?1:0.5;
        UIImage *orimage=[UIImage imageWithCGImage:iref scale:1 orientation:UIImageOrientationUp];
        UIImage *scaleImage = [HBImagePickerControllerEx scaleImage:orimage toScale:scalerat];
        
//        NSString *fileName = [NSString stringWithFormat:@"ios_dz%dp_%@", uploadPhotoMode,representation.filename];
        NSLog(@"旋转方向 %d",[representation orientation]);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (iref) {
                //                photoView.image = image;
                NSData * data = UIImageJPEGRepresentation(scaleImage,1);
                [self uploadImages:data];
            }
        });
    };
    
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:imageURL
                   resultBlock:resultblock
                  failureBlock:^(NSError *error) {
                      [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
                      [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
                      
                  }];
    
    [self dismissViewControllerAnimated:YES completion:^{
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
         [self.navigationController.navigationBar setTintColor:CLR_FOREGROUND];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        [self setNeedsStatusBarAppearanceUpdate];
        [self dismissTips];
    }];
    
}

-(void)uploadImages:(NSData *)imagedata
{
    [UploadImageModel uploadimage:[usersigninModel sharedInstance].session.userid image:imagedata progress:^(REQUEST_TYPE progress) {
        if (progress == RELOADING) {
            [self dismissTips];
            [self presentLoadingTips:@"正在上传..."];
        }
        else if(progress == FAILED)
        {
            [self dismissTips];
            [self presentFailureTips:@"上传失败"];
        }
    } usergetuserblock:^(UploadImage *uploadimageblock) {
        if (uploadimageblock.useruploadimage) {
            [self dismissTips];
            [[BeeImageCache  sharedInstance]  saveData:imagedata forURL:uploadimageblock.useruploadimage.imageurl];
            NSDictionary * dic = [self.dataDictionary objectForKey:KEY_SECTION(0)];
            CELL_STRUCT * cellstruct = [dic objectForKey:KEY_INDEXPATH(0, 0)];
            [cellstruct.array addObject:uploadimageblock.useruploadimage.imageurl];
            [self.dataDictionary setObject:dic forKey:KEY_SECTION(0)];
            [self presentSuccessTips:@"上传成功" dimissblock:^(id sender) {
                [self.tableView reloadData];
            }];
        }
    }];
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    
}

@end
