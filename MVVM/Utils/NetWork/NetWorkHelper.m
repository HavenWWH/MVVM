//
//  NetWorkHelper.m
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "NetWorkHelper.h"
#import <AFNetworking.h>


#ifdef DEBUG
#define NWLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NWLog(...)
#endif

@interface NetWorkHelper()
@end

@implementation NetWorkHelper

static BOOL _isOpenLog;

#pragma mark -----  网络状态监听 --------
// 实时获取网络
+ (void)netWorkWithBlock: (NetWorkStateBlock)netWorkState
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    netWorkState(NetworkReachabilityStatusUnknown);
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    netWorkState(NetworkReachabilityStatusNotReachable);
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    netWorkState(NetworkReachabilityStatusReachableViaWWAN);
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    netWorkState(NetworkReachabilityStatusReachableViaWiFi);
                    break;
            }
        }];
    });
}
// 是否有网络
+ (BOOL)isNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}
// 是否WIFI
+ (BOOL)netWorkIsWiFi
{
    return  [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}
// 是否手机网络
+ (BOOL)netWorkIsWWAN
{
    return  [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

#pragma mark --------- 日志输出 ------------
+ (void)openLog {
    _isOpenLog = YES;
}

+ (void)closeLog {
    _isOpenLog = NO;
}
@end
