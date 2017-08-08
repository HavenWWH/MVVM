//
//  UserSignController.m
//  HarmonizePub
//
//  Created by rzhy on 16/9/2.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "RegisterController.h"
#import <JKCountDownButton.h>
#import "MBProgressHUD+Haven.h"
#import "UserManager.h"
#import <SVProgressHUD.h>
#import "MBProgressHUD+Haven.h"

@interface RegisterController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeField;
@property (weak, nonatomic) IBOutlet JKCountDownButton *getCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *signButton;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"用户注册";
    ViewRadius(self.getCodeButton, 5.0f);
    ViewRadius(self.signButton, 5.0f);
    [self.phoneNumField becomeFirstResponder];
}


#pragma mark - 注册
- (IBAction)signEvent:(UIButton *)sender {
    NSString *phoneString    = _phoneNumField.text;
    NSString *passwordString = _passWordField.text;
    NSString *codeString     = _verificationCodeField.text;
    if (!phoneString || [phoneString isEqualToString:@""])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入手机号码!"];
    else if (![Utils matchingTelNumber:phoneString])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的手机号码!"];
    else if (!passwordString || [passwordString isEqualToString:@""])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入密码!"];
    else if (passwordString.length <= 0 || passwordString.length > 16)
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的密码!\n密码由1-16位数字和字母组成!"];
    else if (!codeString || [codeString isEqualToString:@""])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入验证码!"];
    else {
        kWeakSelf(self);
        [[UserManager sharedUserManager] registerWithPhone: phoneString passWord: passwordString code: codeString success:^(id resultObject) {
            // 注册成功返回登录界面
            if ([self.delegate respondsToSelector:@selector(registerWithPhone:passWord:code:success:failure:)]) {
                [self.delegate registerSuccessWithPhone: phoneString passWord: passwordString];
            }
            [weakself dismissViewControllerAnimated: YES completion: nil];
        } failure:^(NSError *error) {
            
        }];
    }

    
}

//

#pragma mark - 获取验证码
- (IBAction)getCodeButtonEvent:(JKCountDownButton *)sender {
    NSString *phoneNum = self.phoneNumField.text;
    if (!phoneNum || [phoneNum isEqualToString:@""])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入手机号码!"];
    else if (![Utils matchingTelNumber:phoneNum])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的手机号码!"];
    else {
        [self.view endEditing:NO];
        sender.enabled = NO;
        [sender startCountDownWithSecond:60];
        [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.backgroundColor = [UIColor lightGrayColor];
            return [NSString stringWithFormat:@"剩余%lu秒", (unsigned long)second];
        }];
        [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            countDownButton.backgroundColor = RGBColor(125, 26, 31);
            return @"重新获取";
        }];
        [SVProgressHUD show];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        [[UserManager sharedUserManager] getCodeWithPhone: phoneNum type: CodeForgotType success:^{
            [SVProgressHUD dismiss];
            [ZYToast showBottomText:@"验证码发送成功!"];
            _signButton.enabled = YES;
            _signButton.backgroundColor = RGBAColor(125, 26, 31, 0.7);
        }FailMsg:^(id resultObject) {
            [SVProgressHUD dismiss];
            [MBProgressHUD MBHUD_showMBProgressHUDWithTip: NSStringFormat(@"%@", resultObject)];
            [sender stopCountDown];
        }Failure:^(NSError *error) {
            [SVProgressHUD dismiss];
            [sender stopCountDown];
        }];
    }
}

#pragma mark - 显示/隐藏密码
- (IBAction)switchShowAndHidenPassWordEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passWordField.secureTextEntry = !sender.selected;
}

#pragma mark - 返回
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:NO];
}

@end
