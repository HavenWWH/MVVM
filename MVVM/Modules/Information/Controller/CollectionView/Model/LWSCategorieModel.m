//
//  LWSCategorieModel.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LWSCategorieModel.h"
#import "MJExtension.h"


@implementation LWSCategorieModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"subcategories" : @"LWSSubModle"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"idenId" : @"id"};
}
@end
