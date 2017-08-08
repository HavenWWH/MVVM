//
//  NetWorkHelper.h
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    // 未知网络
    NetworkReachabilityStatusUnknown,
    // 不可用网络
    NetworkReachabilityStatusNotReachable ,
    // 手机网络
    NetworkReachabilityStatusReachableViaWWAN,
    // WIFI
    NetworkReachabilityStatusReachableViaWiFi
} NetworkType;

typedef void(^NetWorkStateBlock)(NetworkType networkType);

#ifndef kIsNetwork
#define kIsNetwork     [NetWorkHelper isNetwork]  // 一次性判断是否有网的宏
#endif

#ifndef kIsWWANNetwork
#define kIsWWANNetwork [NetWorkHelper netWorkIsWWAN]  // 一次性判断是否为手机网络的宏
#endif

#ifndef kIsWiFiNetwork
#define kIsWiFiNetwork [NetWorkHelper netWorkIsWiFi]  // 一次性判断是否为WiFi网络的宏
#endif

@interface NetWorkHelper : NSObject

// 实时获取网络
+ (void)netWorkWithBlock: (NetWorkStateBlock)netWorkState;

// 是否有网络
+ (BOOL)isNetwork;

// 是否WIFI
+ (BOOL)netWorkIsWiFi;

// 是否手机网络
+ (BOOL)netWorkIsWWAN;


// 打开日志输出
+ (void)openLog;
// 关闭日志输出
+ (void)closeLog;
@end
