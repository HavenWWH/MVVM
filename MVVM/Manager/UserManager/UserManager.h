//
//  UserManager.h
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum : NSUInteger {
    CodeRegisterType = 1, // 注册
    CodeForgotType = 4  // 忘记密码
} CodeType;


typedef void(^loginSuccessBlock)(id resultObject);
typedef void(^loginFailureBlock)(NSError *error);

typedef void(^successBlock)();
typedef void(^failureBlock)(NSError *error);
typedef void(^failMsgBlock)(id resultObject);

typedef void(^registerSuccessBlock)(id resultObject);
typedef void(^registerFailureBlock)(NSError *error);
@interface UserManager : NSObject

// 创建单例
SINGLETON_FOR_HEADER(UserManager);


// 登录
- (void)loginWithAccount: (NSString *)account passWord: (NSString *)passWord success: (loginSuccessBlock) successBlock failure: (loginFailureBlock) failureBlock;

// 注册
- (void)registerWithPhone:(NSString *)phone passWord: (NSString *)passWord code: (NSString *)code success: (registerSuccessBlock)registerSuccessBlock failure: (registerFailureBlock)registerFailureBlock;

// 忘记密码
- (void)forgotWithPhone: (NSString *)phone password: (NSString *)passWord code: (NSString *)code success: (successBlock)codeSucessBlock FailMsg: (failMsgBlock)failMsgBlock Failure: (failureBlock)codeFailureBlock;

// 获取验证码(密码修改/账号注册)
- (void)getCodeWithPhone: (NSString *)phone type: (CodeType)codeType success: (successBlock)codeSucessBlock FailMsg: (failMsgBlock)failMsgBlock Failure: (failureBlock)codeFailureBlock;
@end
