//
//  NSArray+Haven.h
//  MVVM
//
//  Created by Haven on 2017/7/20.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Haven)

// 数组中查找特定类名的对象的数组
+ (NSArray *)arrayFromArray: (NSArray *)array withClassStr: (NSString *)classStr;

@end
