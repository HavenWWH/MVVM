//
//  MBProgressHUD+Haven.h
//  MVVM
//
//  Created by Haven on 2017/7/14.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Haven)
// 提示信息
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithTip: (NSString *)tip;

// 提示错误
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithError: (NSError *)error;

// 进度和文字
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithProStr: (NSString *)proStr;

// 进度
+ (MBProgressHUD *)MBHUD_show;

// 隐藏
+ (void)MBHUD_hide;

@end
