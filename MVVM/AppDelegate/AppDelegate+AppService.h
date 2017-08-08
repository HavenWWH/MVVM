//
//  AppDelegate+AppService.h
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
// ------  初始化服务  --------
- (void)initService;

// ------  初始化window -------
- (void)initWindow;

// ------  网络监听   -------
- (void)monitorNetworkStatus;

// —————  友盟初始化 —————
- (void)initUMeng;


// -----  获取顶层控制器 -----
-(UIViewController *)getCurrentVC;

-(UIViewController *)getCurrentUIVC;

@end
