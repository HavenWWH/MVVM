//
//  Utils.m
//  JJZYYPub
//
//  Created by Zy on.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "Utils.h"

@interface Utils ()

@end

@implementation Utils

#pragma mark - 匹配手机号
+ (BOOL)matchingTelNumber:(NSString *)telNumber {
    NSString *mobile = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [regextestmobile evaluateWithObject:telNumber];
}

#pragma mark - 匹配密码
+ (BOOL)matchingPassword:(NSString *)password {
    NSString *mobile = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [regextestmobile evaluateWithObject:password];
}

#pragma mark - 匹配邮箱
+ (BOOL)matchingEmail:(NSString *)email {
    NSString *mobile = @"^[a-zA-Z0-9]{4,}@[a-z0-9A-Z]{2,}\\.[a-zA-Z]{2,4}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [regextestmobile evaluateWithObject:email];
}

@end
