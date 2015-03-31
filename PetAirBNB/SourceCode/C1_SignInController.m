//
//  C1_SignInController.m
//  PetAirbnb
//
//  Created by nonato on 14-11-28.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//

#import "C1_SignInController.h"
#import "C2_SignUpController.h"
#import "usersigninModel.h"
#import "Bee_UITipsView+Block.h"
//#import "usersignupModel.h"
@interface C1_SignInController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txt_usercount;
@property (weak, nonatomic) IBOutlet UITextField *txt_userpasword;
 
@end

@implementation C1_SignInController
- (IBAction)findsecretback:(id)sender
{
    
}

- (IBAction)signin:(id)sender {
    [self.txt_usercount resignFirstResponder];
    [self.txt_userpasword resignFirstResponder];
    NSString * userName = self.txt_usercount.text.trim;
    NSString * password = self.txt_userpasword.text.trim;
    if ( 0 == userName.length )//|| NO == [userName isChineseUserName]
    {
        [self presentMessageTips:__TEXT(@"wrong_username")];
        return;
    }
    
    if ( 0 == password.length || NO == [password isPassword] )
    {
        [self presentMessageTips:__TEXT(@"wrong_password")];
        return;
    } 
    
    [usersigninModel usersignin:userName password:password progress:^(REQUEST_TYPE progress) {
        if (progress == RELOADING) {
            [self presentLoadingTips:__TEXT(@"signing_in")];
        }
        else if(progress == FAILED)
        {
            [self dismissTips];
        }
    } signinblock:^(user_signin *block) {
        [self dismissTips];        
        BeeLog(@"%@",block.usersignin);
        if (block.Result.ReturnCode.integerValue <= 106) {
            [self presentSuccessTips:__TEXT(@"welcome_back") dimissblock:^(id sender) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
        }
        else
        {
            [self presentMessageTips:block.Result.Message];
        }

    }];
     
}

//ON_SIGNAL3(BeeUITipsView,WILL_DISAPPEAR, signal)
//{
//    BeeUITipsView *tipsview=(BeeUITipsView *)signal.sourceView;
//    if(tipsview.tag==30)
//    {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//}

- (IBAction)sigininwithweibo:(id)sender
{
    
}


- (IBAction)signup:(id)sender {
    
    C2_SignUpController * signupctr = [[C2_SignUpController alloc] initWithNibName:@"C2_SignUpController" bundle:nil];
    [self.navigationController pushViewController:signupctr animated:YES];
    
}
-(void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"登陆注册";
    
    self.txt_userpasword.delegate = self;
    self.txt_usercount.delegate = self;
    
    LOGIN_SESSION * defaultuser = [usersigninModel defaultUser];
    if (defaultuser.useremail) {
        self.txt_usercount.text = defaultuser.useremail;
        self.txt_userpasword.text = defaultuser.userpassword;
    }
    [self observeNotification:@"notify.C2_SignUpController.signupSuccess"];
}

ON_NOTIFICATION3(C2_SignUpController, signupSuccess, notify)
{
    LOGIN_SESSION * defaultuser = (LOGIN_SESSION *)notify.object;;
    if (defaultuser.useremail) {
        self.txt_usercount.text = defaultuser.useremail;
        self.txt_userpasword.text = defaultuser.userpassword;
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.txt_userpasword) {
        usersignin *count = [usersigninModel usersigninwithemail:self.txt_usercount.text.trim];
        if(count)
        {
            self.txt_userpasword.text = count.userpasswordmd5;
        }
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.txt_usercount isFirstResponder]) {
        
        [self.txt_userpasword becomeFirstResponder];
    }
    else if([self.txt_userpasword isFirstResponder])
    {
        if (!self.txt_usercount.text.length) {
            [self.txt_usercount becomeFirstResponder];
        }
        else
        {
            [self signin:nil];
        }
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
