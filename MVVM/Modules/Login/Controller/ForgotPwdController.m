//
//  ForgotPwdController.m
//  HarmonizePub
//
//  Created by rzhy on 16/9/8.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "ForgotPwdController.h"
#import "JKCountDownButton.h"
#import "SVProgressHUD.h"
#import "UserManager.h"
#import "MBProgressHUD+Haven.h"

@interface ForgotPwdController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet JKCountDownButton *getCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *determineButton;

@end

@implementation ForgotPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"忘记密码";
    ViewRadius(self.determineButton, 5.0f);
    ViewRadius(self.getCodeButton, 5.0f);

}



#pragma mark - 验证码
- (IBAction)getCodeEvent:(JKCountDownButton *)sender {
    NSString *phoneNum = self.phoneField.text;
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
            _determineButton.enabled = YES;
            _determineButton.backgroundColor = RGBAColor(125, 26, 31, 0.7);
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

#pragma mark - 确定
- (IBAction)determineEvent:(UIButton *)sender {
    NSString *phone = self.phoneField.text;
    NSString *pwd = self.passWordField.text;
    NSString *confirmPwd = self.confirmPwdField.text;
    NSString *code = self.codeField.text;
    if (!phone || [phone isEqualToString:@""])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入手机号码!"];
    else if (![Utils matchingTelNumber:phone])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入正确的手机号码!"];
    else if (!pwd.length)
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入密码!"];
    else if (!confirmPwd.length)
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请确认密码!"];
    else if (![confirmPwd isEqualToString:pwd])
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"两次输入的密码不一致，请重新输入！"];
    else if (!code.length)
        [MBProgressHUD MBHUD_showMBProgressHUDWithTip:@"请输入验证码"];
    else {
        [SVProgressHUD show];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        kWeakSelf(self);
        [[UserManager sharedUserManager] forgotWithPhone: phone password: pwd code: code success:^{
            [SVProgressHUD dismiss];
            [ZYToast showBottomText:@"密码修改成功!"];
            if ([_delegate respondsToSelector:@selector(forgotPwdController:phone:passWord:)])
                [_delegate forgotPwdController:weakself phone:phone passWord:pwd];
            [weakself dismissViewControllerAnimated:YES completion:nil];
        } FailMsg:^(id resultObject) {
            [SVProgressHUD dismiss];
            [MBProgressHUD MBHUD_showMBProgressHUDWithTip: NSStringFormat(@"%@", resultObject)];
        } Failure:^(NSError *error) {
            [SVProgressHUD dismiss];
        }];
        
    }

}

#pragma mark - 返回
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated: YES completion: nil];
}


#pragma mark - textField delegat
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:NO];
}

@end
