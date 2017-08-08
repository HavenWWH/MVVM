//
//  NSString+Zy.h
//
//  Created by zy on 15/11/3.
//  Copyright © 2015年 zengyu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WeekdayDateStringType) {
    WeekdayDateStringTypeXingQi,    // 星期(默认)
    WeekdayDateStringTypeNumber,    // 数字
    WeekdayDateStringTypeZhou       // 周
};

@interface NSString (Zy)

// 拼接字符串
- (NSString *)fileAppend:(NSString *)string;
// 去除 Null
- (NSString *)deleteNullAndNilString;
// 去除特殊符
- (NSString *)stringRemoveSpecialSymbol:(NSString *)symbol;
// 截取字符串
- (NSString *)stringInterceptWithBeginString:(NSString *)beginString endString:(NSString *)endString;
- (NSString *)stringInterceptWithBegin:(NSInteger)begin end:(NSInteger)end;
// 解析时间戳
- (NSString *)dateTimeIntervalSince1970Format:(NSString *)format;
// 解析date字符串
- (NSString *)dateStringAnalysWithFormat:(NSString *)format dateFormat:(NSString *)dateFormat;
// 比较
- (BOOL)stringIgnoreSmallCapsWithString:(NSString *)string;
// 拼音
- (NSString *)stringChineseTransformToPinyin;
// 实时获取内容
- (NSString *)stringRealTimeAcquisitionTextWithRange:(NSRange)range string:(NSString *)string;
// 转换成date
- (NSDate *)dateStringWithFormat:(NSString *)format;

// 去除特殊符
+ (NSString *)stringRemoveSpecialSymbol:(NSString *)symbol string:(NSString *)string;
// 系统时间
+ (NSString *)stringCurrentDateStringWitnFormat:(NSString *)format;
// 星期字符串
+ (NSString *)stringWeekdayWithFromDate:(NSDate *)inputDate weekType:(WeekdayDateStringType)weekType;
// <null>
+ (NSString *)stringDeleteNullWithString:(NSString *)string;
// 解析时间戳
+ (NSString *)dateTimeIntervalSince1970:(NSInteger)interval Format:(NSString *)format;
// 解析date数据
+ (NSString *)stringAnalysisWithDate:(NSDate *)date format:(NSString *)format;

// date数据转换成秒
+ (NSString *)stringWithDate: (NSDate *)date;

+ (NSString *)timeLogString;

@end
