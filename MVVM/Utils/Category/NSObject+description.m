//
//  NSObject+description.m
//  MVVM
//
//  Created by Haven on 2017/8/1.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "NSObject+description.h"
#import <objc/runtime.h>

@implementation NSObject (description)
- (NSString *)description
{
    // 正常类型不做处理
    if ([self isKindOfClass: [NSArray class]] || [self isKindOfClass: [NSDictionary class]] || [self isKindOfClass: [NSString class]] ||[self isKindOfClass: [NSNumber class]]) {
        return  self.description;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    uint count;
    // 获取类的属性列表，第一个参数是类，第二个参数是接收类属性数目的变量
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0;  i < count;  i++) {
        // 取出属性
        objc_property_t property = properties[i];
        // 根据属性获取key
        NSString *name = @(property_getName( property));
        // 根据key获取值, 值不存在时,为nil
        id value = [self valueForKey: name] ? : @"nil";
        // 添加到字典
        [dict setObject: value forKey: name];
    }
    // 释放
    free(properties);
    
    return [NSString stringWithFormat:@"<%@ : %p>\n{%@}", [self class], self, dict];
}
    
- (NSString *)debugDescription
{
    // 正常类型不做处理
    if ([self isKindOfClass: [NSArray class]] || [self isKindOfClass: [NSDictionary class]] || [self isKindOfClass: [NSString class]] ||[self isKindOfClass: [NSNumber class]]) {
        return  self.description;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    uint count;
    // 获取类的属性列表，第一个参数是类，第二个参数是接收类属性数目的变量
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0;  i < count;  i++) {
        // 取出属性
        objc_property_t property = properties[i];
        // 根据属性获取key
        NSString *name = @(property_getName( property));
        // 根据key获取值, 值不存在时,为nil
        id value = [self valueForKey: name] ? : @"nil";
        // 添加到字典
        [dict setObject: value forKey: name];
    }
    // 释放
    free(properties);
    
    return [NSString stringWithFormat:@"<%@ : %p>---{%@}", [self class], self, dict];
}
@end
