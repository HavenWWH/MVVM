//
//  NSDictionary+Zy.h
//
//  Created by Zy on 2017/1/16.
//  Copyright © 2017年 Zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Zy)

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

@end
