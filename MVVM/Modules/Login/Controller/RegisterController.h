//
//  UserSignController.h
//  HarmonizePub
//
//  Created by rzhy on 16/9/2.
//  Copyright © 2016年 Zy. All rights reserved.
//
//  用户注册

#import <UIKit/UIKit.h>

@protocol RegisterControllerDelegate <NSObject>

- (void)registerSuccessWithPhone: (NSString *)phone passWord: (NSString *)passWord;

@end
@interface RegisterController : UIViewController

@property (nonatomic, weak) id<RegisterControllerDelegate> delegate;

@end
