//
//  NSArray+Haven.m
//  MVVM
//
//  Created by Haven on 2017/7/20.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "NSArray+Haven.h"

@implementation NSArray (Haven)
+ (NSArray *)arrayFromArray: (NSArray *)array withClassStr: (NSString *)classStr
{
    NSMutableArray *mubArr = [NSMutableArray array];
    for (id object  in array) {
        if ([object isKindOfClass: NSClassFromString(classStr)]) {
            [mubArr addObject: object];
        }
    }
    return (NSArray *)mubArr;
}
@end
