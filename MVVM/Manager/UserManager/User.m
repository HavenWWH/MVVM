//
//  User.m
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "User.h"
#import <YYModel.h>

@implementation User
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"icon" : @"headImage",
             @"identifier" : @"id"
             };
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (NSString *)description {
    return [self yy_modelDescription];
}

@end
