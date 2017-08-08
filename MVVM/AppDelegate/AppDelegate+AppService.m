//
//  AppDelegate+AppService.m
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "NetWorkHelper.h"
#import "UIStoryboard+Haven.h"
#import "LoginController.h"
@implementation AppDelegate (AppService)

#pragma mark ------  初始化服务  --------
- (void)initService
{
    // 监听登录状态
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(loginStateChange:) name: KNotificationLoginStateChange object: nil];
    
    // 网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(netWorkStateChange:) name: KNotificationNetWorkStateChange object: nil];
}


- (void)loginStateChange: (NSNotification *)notice
{
    BOOL loginSuccess = [notice.object boolValue];

    if (loginSuccess) {//登陆成功加载主窗口控制器
        DLog(@"登录成功");
        [UIStoryboard showInitialVCWithName: @"Main"];
    }else {//登陆失败加载登陆页面控制器
        LoginController *loginVc = [[LoginController alloc] init];
        self.window.rootViewController = loginVc;
    }
}

- (void)netWorkStateChange: (NSNotification *)notice
{
    BOOL isNetWork = [notice.object boolValue];
    
    if (isNetWork) {//有网络
        DLog(@"又网络");
    }else {//无网络
        DLog(@"无网络");
    }
}

#pragma mark -------  初始化window -------
- (void)initWindow
{
//    LoginController *loginVc = [[LoginController alloc] init];
//    self.window.rootViewController = loginVc;
    
}

#pragma mark ------ 网络监听 -------
- (void)monitorNetworkStatus
{
    [NetWorkHelper netWorkWithBlock:^(NetworkType networkType) {
        switch (networkType) {
            case NetworkReachabilityStatusUnknown:
                DLog(@"未知网络");
                break;
            case NetworkReachabilityStatusNotReachable:
                DLog(@"无网络");
                KPostNotification(KNotificationNetWorkStateChange, @NO);
                break;
            case NetworkReachabilityStatusReachableViaWWAN:
                DLog(@"手机网络");
                break;
            case NetworkReachabilityStatusReachableViaWiFi:
                DLog(@"WIFI");
                KPostNotification(KNotificationNetWorkStateChange, @YES);
                break;
        }
    }];
}

#pragma mark ————— 友盟初始化 —————
-(void)initUMeng{
//    /* 打开调试日志 */
//    [[UMSocialManager defaultManager] openLog:YES];
//    
//    /* 设置友盟appkey */
//    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengKey];
    
//    /* 配置第三方 微信, QQ,  微博等*/
//    [self configUSharePlatforms];
}


#pragma mark ----- 获取当前顶层控制器 ----
-(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}


@end
