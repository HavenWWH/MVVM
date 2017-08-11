//
//  UtilsMacros.h
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//  全局宏定义

#ifndef UtilsMacros_h
#define UtilsMacros_h

// 获取系统对象
#define kApplication         [UIApplication sharedApplication]
#define kAppWindow           [UIApplication sharedApplication].delegate.window
#define kAppDelegate         [AppDelegate shareAppDelegate]
#define kRootViewController  [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults        [NSUserDefaults standardUserDefaults]
#define kNotificationCenter  [NSNotificationCenter defaultCenter]

//获取屏幕宽高
#define KScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

//设备判断 iPhone
#define iPhoneSE XHScreenWidth == 320.0f && XHScreenHeight == 568.0f
#define iPhone6s XHScreenWidth == 375.0f && XHScreenHeight == 667.0f
#define iPhone6P XHScreenWidth == 414.0f && XHScreenHeight == 736.0f
#define iPhone4s XHScreenWidth == 320.0f && XHScreenHeight == 480.0f

//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//设置View圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//设置View圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


// 轮播图,HeaderView视图比例
#define viewScale 1.34

//颜色 color
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBColor(r, g, b) RGBAColor(r, g, b, 1.0)

///IOS 版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)
// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define isDebug YES
#else
#define DLog(...)
#define isDebug NO
#endif

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//字体
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
//图片
#define IMAGE_NAMED(name) [UIImage imageNamed:name]

//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];


//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

// User保存路径
#define UserPath [ZYFileManager getDocumentDirectoryWithFileName:@"User.plist"]

#endif /* UtilsMacros_h */
