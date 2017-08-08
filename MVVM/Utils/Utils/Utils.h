//
//  Utils.h
//  JJZYYPub
//
//  Created by Zy on.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

/**
 *  匹配手机号
 *  @param telNumber 手机号
 *  @return Boolean(YES/NO)
 */
+ (BOOL)matchingTelNumber:(NSString*)telNumber;

/**
 * 匹配密码
 * @param password 密码
 * @return Boolean(YES/NO)
 */
+ (BOOL)matchingPassword:(NSString *)password;

/**
 * 匹配邮箱
 * @param email 邮箱
 * @return Boolean(YES/NO)
 */
+ (BOOL)matchingEmail:(NSString *)email;

@end
