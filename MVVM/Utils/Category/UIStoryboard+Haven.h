//
//  UIStoryboard+Haven.h
//  DIDIAmbulancePub
//
//  Created by Haven on 2016/12/19.
//  Copyright © 2016年 Haven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Haven)
// 设置Storyboard为根控制器
+(void)showInitialVCWithName:(NSString *)name;

// 获取storyboard默认的第一个视图控制器
+(id)initialVCWithName:(NSString *)name;

// 根据storyboard名称和id获取相应控制器
+ (id)initialVCWithName: (NSString *)name identifier: (NSString *)storyboardId;
@end
