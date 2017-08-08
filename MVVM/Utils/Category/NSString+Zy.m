//
//  NSString+Zy.m
//
//  Created by zy on 15/11/3.
//  Copyright © 2015年 zengyu. All rights reserved.
//

#import "NSString+Zy.h"

@implementation NSString (Zy)

#pragma mark - 对象方法
#pragma mark 拼接字符串
- (NSString *)fileAppend:(NSString *)string {
    NSString *ext = [self pathExtension];
    NSString *nameString = [self stringByDeletingPathExtension];
    nameString = [nameString stringByAppendingString:string];
    nameString = [nameString stringByAppendingPathExtension:ext];
    return nameString;
}

#pragma mark 去除 null
- (NSString *)deleteNullAndNilString {
    if ([self isEqual:[NSNull null]]) return @"";
    if (self == nil) return @"";
    return self;
}

#pragma mark 去除特殊符
- (NSString *)stringRemoveSpecialSymbol:(NSString *)symbol{
    if (!symbol.length) return nil;
    return [self stringByReplacingOccurrencesOfString:symbol withString:@""];
}

#pragma mark 截取字符串
- (NSString *)stringInterceptWithBeginString:(NSString *)beginString endString:(NSString *)endString {
    NSInteger begin = 0;
    if (!beginString.length && ![beginString isEqualToString:@""]) begin = [self rangeOfString:beginString].location + 1;
    NSInteger end = self.length;
    if (endString && ![endString isEqualToString:@""]) end = [self rangeOfString:endString].location;
    return [self stringInterceptWithBegin:begin end:end];
}

- (NSString *)stringInterceptWithBegin:(NSInteger)begin end:(NSInteger)end {
    if (begin < 0) return nil;
    if (end - begin > self.length) return nil;
    return [self substringWithRange:NSMakeRange(begin, end - begin)];
}

#pragma mark 解析时间戳
- (NSString *)dateTimeIntervalSince1970Format:(NSString *)format{
    if (!self.length || !format.length) return nil;
    NSInteger dateInterval = [[self stringInterceptWithBeginString:@"(" endString:@")"] integerValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInterval];
    return [NSString stringAnalysisWithDate:date format:format];
}

#pragma mark 解析date字符串
- (NSString *)dateStringAnalysWithFormat:(NSString *)format dateFormat:(NSString *)dateFormat {
    if (!format.length) return nil;
    return [NSString stringAnalysisWithDate:[self dateStringWithFormat:format] format:dateFormat];
}

#pragma mark 比较
- (BOOL)stringIgnoreSmallCapsWithString:(NSString *)string {
    if (!string.length) return NO;
    // 全部字符转为小写字母
    NSString *str = [[self lowercaseString] stringRemoveSpecialSymbol:@" "];
    string = [[string lowercaseString] stringRemoveSpecialSymbol:@" "];
    BOOL isString = [str isEqualToString:string];
    return isString;
}

#pragma mark 中文转拼音
- (NSString *)stringChineseTransformToPinyin {  
    NSMutableString *mutableString = [NSMutableString stringWithString:self];  
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);  
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];  
    return [mutableString stringRemoveSpecialSymbol:@" "];
}

#pragma mark 实时获取内容
- (NSString *)stringRealTimeAcquisitionTextWithRange:(NSRange)range string:(NSString *)string {
    NSString *text = [self stringByAppendingString:string];
    if (range.length > 0) text = [text stringInterceptWithBegin:0 end:text.length - range.length];
    if ([text isEqualToString:@""]) text = nil;
    return text;
}

#pragma mark 转换成date
- (NSDate *)dateStringWithFormat:(NSString *)format {
    if (!format.length) return nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

#pragma mark - 类方法
#pragma mark 去除特殊符
+ (NSString *)stringRemoveSpecialSymbol:(NSString *)symbol string:(NSString *)string {
    if (!symbol.length || !string.length) return nil;
    return [string stringByReplacingOccurrencesOfString:symbol withString:@""];
}

#pragma mark 系统时间字符串
+ (NSString *)stringCurrentDateStringWitnFormat:(NSString *)format {
    if (!format.length) return nil;
    NSDate *date = [NSDate date];
    return [self stringAnalysisWithDate:date format:format];
}

#pragma mark 周时间字符串
+ (NSString *)stringWeekdayWithFromDate:(NSDate *)inputDate weekType:(WeekdayDateStringType)weekType {
    if (!inputDate) return nil;
    NSArray *weekdays = [NSArray arrayWithObjects:[NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    if (weekType == WeekdayDateStringTypeNumber)
        weekdays = [NSArray arrayWithObjects:[NSNull null], @"日", @"一", @"二", @"三", @"四", @"五", @"六", nil];
    else if (weekType == WeekdayDateStringTypeZhou)
        weekdays = [NSArray arrayWithObjects:[NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}

#pragma mark 解析时间戳
+ (NSString *)dateTimeIntervalSince1970:(NSInteger)interval Format:(NSString *)format {
    if (!format.length) return nil;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval / 1000.0];
    return [self stringAnalysisWithDate:date format:format];
}

#pragma mark 解析date数据
+ (NSString *)stringAnalysisWithDate:(NSDate *)date format:(NSString *)format {
    if (!date || !format.length) return nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeZone:nil];
    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

#pragma mark 去除 null
+ (NSString *)stringDeleteNullWithString:(NSString *)string {
    if ([string isEqual:[NSNull null]]) return @"";
    if (string == nil) return @"";
    return string;
}
// date数据转换成秒
+ (NSString *)stringWithDate: (NSDate *)date
{
    NSTimeInterval second =[date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f", second];
}
+ (NSString *)timeLogString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}

@end
