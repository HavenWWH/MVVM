//
//  NSDate+extension.h
//  01-创建TableBar及子控制器
//
//  Created by Haven on 16/6/13.
//  Copyright © 2016年 Haven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extension)
/**
 *  判断某个时间是否为今年
 *  使用系统日历对象， 判断两个日期的年是否相等
 */
- (BOOL)isThisYear;

/**
 *  判断某个时间是否为昨天
 *  使用系统日历对象， 将两个日期转换成 yyyy-MM-dd 00:00:00 格式进行比较(不受小时，分钟，秒的影响)， 系统会自动判断相差的天数
 */
- (BOOL)isYesterday;

/**
 *  判断某个时间是否为今天
 *  使用系统日历对象， 将两个日期转换成 yyyy-MM-dd 00:00:00 格式进行比较(不受小时，分钟，秒的影响)， 系统会自动判断相差的天数
 */
- (BOOL)isToday;

@end
