//
//  UIImage+Haven.h
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Haven)
/**
 *返回中心拉伸的图片
 */
+(UIImage *)stretchedImageWithName:(NSString *)name;

/**
 *  剪裁图片
 
 */
+ (instancetype)imageWithName:(NSString *)name andBorder:(CGFloat)border andBorderColor:(UIColor *)color;

/**
 截屏
 */
+ (instancetype)imageWithCaptureView:(UIView *)view;
@end
