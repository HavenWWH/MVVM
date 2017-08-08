//
//  URLMacros_h.h
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//  接口文件, 包含项目中所有接口

#ifndef URLMacros_h
#define URLMacros_h

// 服务器切换
#define DevelopSever    0
#define TestSever       0
#define ProductSever    1

#if DevelopSever
/**开发服务器*/
#define URL_main @"http://110.85.7.10:501/Ddjhc"
#elif TestSever
/**测试服务器*/
#define URL_main @"http://110.85.7.10:501/Ddjhc"
#elif ProductSever
/**生产服务器*/
#define URL_main @"http://116.62.50.113:501/Ddjhc";
#endif



#pragma mark - ——————— 详细接口地址 ————————

//测试接口
#define URL_Test @"/api/cast/home/start"


#pragma mark - ——————— 用户相关 ————————
//登录接口
#define LoginPath @"/userLogin"
//验证码
#define CheckPhonePath @"/checkPhone"
//注册
#define RegisterPath @"/userReg"
//忘记密码
#define ForgetPasswordPath  @"/forgetPassword"


#pragma mark - ——————— 急救相关 ————————
// 获取急救手册目录
#define GetRescueTitler  @"/getRescueTitle"

#endif /* URLMacros_h_h */
