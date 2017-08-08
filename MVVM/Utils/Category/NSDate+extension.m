//
//  NSDate+extension.m
//  01-创建TableBar及子控制器
//
//  Created by Haven on 16/6/13.
//  Copyright © 2016年 Haven. All rights reserved.
//

#import "NSDate+extension.h"

@implementation NSDate (extension)
/**
 *  判断某个时间是否为今年
 *  使用系统日历对象， 判断两个日期的年是否相等
 */
- (BOOL)isThisYear
{
    //  使用日历对象， 方便比较两个日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // NSCalendarUnit 代理想获得哪些差值, 此处只需显示年
    NSCalendarUnit unit = NSCalendarUnitYear;
    
    // 计算微博创建时间的值， 取出某个日期的年， 月， 日，时，等信息
    NSDateComponents *createdCps = [calendar components:unit fromDate: self];
    NSDateComponents *nowCps = [calendar components:unit fromDate: [NSDate date]];
    
    return createdCps.year == nowCps.year;
}

/**
 *  判断某个时间是否为昨天
 *  使用系统日历对象， 将两个日期转换成 yyyy-MM-dd 00:00:00 格式进行比较(不受小时，分钟，秒的影响)， 系统会自动判断相差的天数
 */
- (BOOL)isYesterday
{
    // 当前日期
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2016-04-31 18:12:34-->2016-04-31
    // 2016-05-01 18:11:32-->2016-05-01
    NSString *nowStr = [fmt stringFromDate:nowDate];
    NSString *createStr = [fmt stringFromDate:self];
    
    // 2016-04-31 18:12:34-->2016-04-31 00:00:00
    // 2016-05-01 18:11:32-->2016-05-01 00:00:00
    nowDate = [fmt dateFromString:nowStr];
    NSDate *create_Date = [fmt dateFromString:createStr];
    
    //  使用日历对象， 方便比较两个日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // NSCalendarUnit 代理想获得哪些差值, 此处只需显示年月日
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    // 计算这两个日期的差值
    NSDateComponents *cps = [calendar components: unit fromDate: create_Date toDate: nowDate options: 0];
    
    return cps.year == 0 && cps.month == 0 && cps.day == 1;
    
}

/**
 *  判断某个时间是否为今天
 *  使用系统日历对象， 将两个日期转换成 yyyy-MM-dd 00:00:00 格式进行比较(不受小时，分钟，秒的影响)， 系统会自动判断相差的天数
 */
- (BOOL)isToday
{
    // 当前日期
    NSDate *nowDate = [NSDate date];
    
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy-MM-dd";
//    
//    // 2016-04-31 18:12:34-->2016-04-31
//    // 2016-05-01 18:11:32-->2016-05-01
//    NSString *nowStr = [fmt stringFromDate:nowDate];
//    NSString *createStr = [fmt stringFromDate:self];
    NSString *nowStr = [nowDate dateToStr];
    NSString *createStr = [self dateToStr];
    
    // 日期一样则为同一天
    return [nowStr isEqualToString:createStr];
}

// 将日期转换成年月日格式字符串
- (NSString *)dateToStr{
  
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2016-05-01 18:11:32-->2016-05-01
    return [fmt stringFromDate: self];
}


@end
