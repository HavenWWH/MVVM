//
//  HavenScrollView.h
//  HavenScrollView
//
//  Created by Haven on 2016/11/2.
//  Copyright © 2016年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickLableBlock)(NSInteger index, NSString *string);

@interface HavenScrollView : UIView
// lable点击Block
@property (nonatomic, strong) void(^clickLableBlock)(NSInteger index, NSString *string);

// lable点击事件
- (void)clickLableWithBlock: (clickLableBlock)clickBlock;

// 标题数组
@property (nonatomic, strong) NSArray *titleArray;

// 设置字体大小
@property (nonatomic, assign)  CGFloat fontSize;

// 设置颜色
@property (nonatomic, strong) UIColor *titleColor;

// 设置背景颜色
@property (nonatomic, strong) UIColor *BgColor;

// 移除定时器
- (void)removeTimer;

// 添加定时器
- (void)addTimer;
@end
