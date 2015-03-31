//
//  C2_SignUpController.m
//  PetAirbnb
//
//  Created by BooB on 14-11-30.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//
#import "C3_EditUserInfoController.h"
#import "C2_SignUpController.h"
//#import "UIView+TapGesture.h"
#import "usersignupModel.h"
#import "Bee_UINavigationBar.h"
@interface C2_SignUpController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_confirmpassword;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
//@property (nonatomic,strong) usersignupModel * registermodel;
@end

@implementation C2_SignUpController
DEF_NOTIFICATION(signupSuccess)

-(void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  __TEXT(@"signing_up");
    [BeeUINavigationBar setButtonSize:CGSizeMake(60, 30)];
    [self showBarButton:BeeUINavigationBar.RIGHT  title:__TEXT(@"bonus_submit")];
//    self.scrollview.tapEnabled = YES;
    
    self.txt_confirmpassword.delegate = self;
    self.txt_email.delegate = self;
    self.txt_password.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

ON_RIGHT_BUTTON_TOUCHED(signal)
{
    [self signupTap:nil];
}
-(void)signupTap:(id)sender
{
     BeeLog(@"submit ...");
    
    [self handelSingleTap];
//    NSString * userName = self.txt_email.text.trim;//$(@"username").text.trim;
    NSString * password = self.txt_password.text.trim; //$(@"password").text.trim;
    NSString * email=self.txt_email.text.trim;
    NSString * confirmpassword=self.txt_confirmpassword.text.trim;
    
    if (![confirmpassword isEqualToString:password]) {
        [self presentMessageTips:__TEXT(@"password_not_match")];
        return;
    }
    
    
    if ( 0 == password.length )//|| NO == [password isPassword]
    {
        [self presentMessageTips:__TEXT(@"wrong_password")];
        return;
    }
    
    if ( password.length < 6 )
    {
        [self presentMessageTips:__TEXT(@"password_too_short")];
        return;
    }
    
    if ( password.length > 18 )
    {
        [self presentMessageTips:__TEXT(@"password_too_long")];
        return;
    }
    
    if (0 == email.length || NO ==[email  isEmail] ) {
        [self presentMessageTips:__TEXT(@"wrong_email")];
        return;
    }
    
    
    [usersignupModel usersignupwith:email password:password progress:^(REQUEST_TYPE progress) {
        if (progress == FAILED) {
            [self dismissTips];
            BeeLog(@"Faied!!!");
        }
        else if(progress == RELOADING)
        {
            BeeLog(@"LOADING...");
            [self presentLoadingTips:__TEXT(@"signing_up")];
        }
        
    }signupblock:^(user_signup *block) {
        NSLog(@"%@",block.usersignup);
        [self dismissTips];
        [self presentSuccessTips:@"注册成功"];
        LOGIN_SESSION * session = [[LOGIN_SESSION alloc] init];
        session.useremail = email;
        session.userpassword = password;
        session.userid = block.usersignup.userid;        
        [self postNotification:self.signupSuccess withObject:session];
//        [self.navigationController popViewControllerAnimated:YES];
        C3_EditUserInfoController * editctr =[[C3_EditUserInfoController  alloc] initWithNibName:@"C3_EditUserInfoController" bundle:nil];
      [self.navigationController pushViewController:editctr animated:YES];
        
    }];
    
//    [self.registermodel  signupWithUser:userName password:password email:email];
    
    
}
-(void)handelSingleTap
{
    [self.txt_confirmpassword resignFirstResponder];
    [self.txt_email resignFirstResponder];
    [self.txt_password resignFirstResponder];
}

ON_SIGNAL3(UIView, TAPPED, signal)
{
    [self handelSingleTap];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag <1513) {
        UITextField *subtextfield=(UITextField *)[self.scrollview viewWithTag:(textField.tag+1)];
        [subtextfield becomeFirstResponder];
    }
    else
    {
        [self signupTap:nil];
    }
    return YES;
}

- (void)keyBoardWillShow:(NSNotification *)notify 
{
    CGRect rect = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat ty = rect.size.height;
    [UIView animateWithDuration:[notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
         self.scrollview.contentSize = CGSizeMake(rect.size.width, CGRectGetHeight(self.view.frame) + ty);
    }];
}


-(void)keyBoardWillHide:(NSNotification *)notify
{
    [UIView animateWithDuration:[notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] animations:^{
        self.scrollview.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.view.frame));
    }];
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
