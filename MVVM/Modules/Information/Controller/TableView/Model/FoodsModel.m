//
//  FoodsModel.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "FoodsModel.h"
#import "MJExtension.h"

@implementation FoodsModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"foodId" : @"id"};
}
@end
