//
//  LoginController.m
//  HarmonizePub
//
//  Created by rzhy on 16/8/20.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "LoginController.h"
#import <SVProgressHUD.h>
#import "UserManager.h"
#import "RegisterController.h"
#import "MBProgressHUD+Haven.h"
#import "ForgotPwdController.h"


@interface LoginController () <UITextFieldDelegate,RegisterControllerDelegate, ForgotPwdControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (isDebug) {
        self.userNameField.text = @"18950476351";
        self.passWordField.text = @"q";
    }
    ViewRadius(self.loginButton, 5.0f);


}

- (IBAction)back:(UIButton *)sender {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - 登录
- (IBAction)loginEvent:(UIButton *)sender {
    NSString *userName = self.userNameField.text;
    NSString *passWord = self.passWordField.text;
    if (!userName || [userName isEqualToString:@""]) {
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"手机号不能为空"];
    } else if (![Utils matchingTelNumber:userName]) {
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的手机号码!"];
    } else if (!passWord || [passWord isEqualToString:@""]) {
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip: @"请输入密码"];
    } else if (passWord.length <= 0 || passWord.length > 16) {
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的密码!\n密码由1-16位数字和字母组成!"];
    } else {
        [[UserManager sharedUserManager] loginWithAccount: userName passWord: passWord success:^(id resultObject) {
            DLog(@"登录成功");
        } failure:^(NSError *error) {
            DLog(@"登录失败");
        }];
    }
}


#pragma mark - 注册
- (IBAction)signEvent:(UIButton *)sender {
    RegisterController *registerVc = [[RegisterController alloc] init];
    registerVc.delegate = self;
    [self presentViewController: registerVc animated: YES completion: nil];
}

#pragma mark ------- 注册成功 --------
- (void)registerSuccessWithPhone:(NSString *)phone passWord:(NSString *)passWord
{
    self.userNameField.text = phone;
    self.passWordField.text = passWord;
}
#pragma mark - 忘记密码
- (IBAction)forgotPassWordEvent:(UIButton *)sender {
    ForgotPwdController *forgotVc = [[ForgotPwdController alloc] init];
    forgotVc.delegate = self;
    [self presentViewController: forgotVc animated: YES completion: nil];
}

#pragma mark ------- 密码修改成功 -----
- (void)forgotPwdController:(UIViewController *)controller phone:(NSString *)phone passWord:(NSString *)pwd
{
    self.userNameField.text = phone;
    self.passWordField.text = pwd;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:NO];
}

@end
