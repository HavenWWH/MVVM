//
//  UserManager.m
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "UserManager.h"
#import "HTTPSTool.h"
#import <YYModel.h>
#import "User.h"

@implementation UserManager
// 创建单例
SINGLETON_FOR_CLASS(UserManager);

#pragma mark ------- 登录 ---------

- (void)loginWithAccount: (NSString *)account passWord: (NSString *)passWord success: (loginSuccessBlock) successBlock failure: (loginFailureBlock) failureBlock
{
    NSDictionary *params =@{@"userName" : account,
                           @"password" : passWord,
                           @"deviceType" : @(1),
                           @"userType" : @(1)
                           };
    kWeakSelf(self);
    [HTTPSTool POSTRequestWithPath: LoginPath params: params success:^(NSDictionary * _Nonnull JSON) {
        // 登录成功回调
        if(successBlock) successBlock(JSON);
        
        // 异步登录极光
        
        // 异步登录云信
        
        // 数据处理
        [weakself dataOperationWithDataDictionary:JSON[@"data"]];

    } failure:^(NSError * _Nonnull error) {
        if(failureBlock) failureBlock(error);
    }];

}


- (void)dataOperationWithDataDictionary:(NSDictionary *)dataDict {

    // 保存token
    NSString *token = [@"token=" stringByAppendingString:dataDict[@"token"]];
    [UserDefaultsTool setObject: token forKey: Token];
    
    // 保存用户信息
    NSDictionary *userDict = dataDict[@"user"];
    User *user = [User yy_modelWithJSON: userDict];
    [NSKeyedArchiver archiveRootObject: user toFile: UserPath];
    
    // 极光别名设置
    
    // 登录界面跳转
    KPostNotification(KNotificationLoginStateChange, @YES);
}
#pragma mark ------- 注册 ---------
- (void)registerWithPhone:(NSString *)phone passWord: (NSString *)passWord code: (NSString *)code success: (registerSuccessBlock)registerSuccessBlock failure: (registerFailureBlock)registerFailureBlock
{
    NSDictionary *param = @{@"phone" : phone,
                            @"password" : passWord,
                            @"deviceType" : @"1",
                            @"code" : code,
                            @"userType" : @"1"
                            };
    [HTTPSTool POSTRequestWithPath: RegisterPath params: param success:^(NSDictionary * _Nonnull JSON) {
        if (registerSuccessBlock) registerSuccessBlock(JSON);
    } failure:^(NSError * _Nonnull error) {
        if (registerFailureBlock) registerFailureBlock(error);
    }];
  
}

#pragma mark -------- 忘记密码   ---------
- (void)forgotWithPhone:(NSString *)phone password:(NSString *)passWord code:(NSString *)code success:(successBlock)codeSucessBlock FailMsg:(failMsgBlock)failMsgBlock Failure:(failureBlock)codeFailureBlock
{
    NSDictionary *param = @{@"code" : code,
                            @"userName" : phone,
                            @"newPassword" : passWord,
                            @"userType" : @"1"};
    [HTTPSTool POST: ForgetPasswordPath params: param cookie: nil success:^(NSDictionary * _Nonnull JSON) {
        NSInteger result = [JSON[@"ret"] integerValue];
        if (result > 1) {
            if (failMsgBlock)failMsgBlock(JSON[@"msg"]);
        } else if (result == 1) {
            if (codeSucessBlock)codeSucessBlock();
        } else {
            if (failMsgBlock)failMsgBlock(JSON[@"msg"]);
        }
    } failure:^(NSError * _Nonnull error) {
        if (codeFailureBlock)codeFailureBlock(error);
    }];
}
#pragma mark -------- 获取验证码 ---------
- (void)getCodeWithPhone: (NSString *)phone type: (CodeType)codeType success: (successBlock)codeSucessBlock FailMsg: (failMsgBlock)failMsgBlock Failure: (failureBlock)codeFailureBlock
{
    NSDictionary *param = @{@"phone" : phone,
                            @"userType" : NSStringFormat(@"%lu",(unsigned long)codeType)
                            };
    [HTTPSTool POST: CheckPhonePath params: param cookie: nil success:^(NSDictionary * _Nonnull JSON) {
        NSInteger result = [JSON[@"ret"] integerValue];
        if (result > 1) {
            if (failMsgBlock)failMsgBlock(JSON[@"msg"]);
        } else if (result == 1) {
            if (codeSucessBlock)codeSucessBlock();
        } else {
            if (failMsgBlock)failMsgBlock(JSON[@"msg"]);
        }
    } failure:^(NSError * _Nonnull error) {
        if (codeFailureBlock)codeFailureBlock(error);
    }];
     

}
@end
