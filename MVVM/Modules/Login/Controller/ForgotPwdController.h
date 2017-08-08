//
//  ForgotPwdController.h
//  HarmonizePub
//
//  Created by rzhy on 16/9/8.
//  Copyright © 2016年 Zy. All rights reserved.
//
//  忘记密码

#import <UIKit/UIKit.h>

@protocol ForgotPwdControllerDelegate <NSObject>

- (void)forgotPwdController: (UIViewController *)controller phone: (NSString *)phone passWord: (NSString *)pwd;

@end

@interface ForgotPwdController : UIViewController
@property (nonatomic, weak) id<ForgotPwdControllerDelegate> delegate;
@end
