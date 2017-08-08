//
//  UIImage+Haven.m
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "UIImage+Haven.h"

@implementation UIImage (Haven)
/**
 *返回中心拉伸的图片
 */
+(UIImage *)stretchedImageWithName:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    int leftCap = image.size.width * 0.5;
    int topCap = image.size.height * 0.5;
    return [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}


/**
 *  剪裁图片
 
 */
+ (instancetype)imageWithName:(NSString *)name andBorder:(CGFloat)border andBorderColor:(UIColor *)color
{
    //1, 设置圆环的宽度
    CGFloat borderW = border;
    //2, 加载旧的图片
    UIImage *oldImage = [UIImage imageNamed: name];
    //3, 设置新的图片尺寸
    CGFloat imageW = oldImage.size.width + 2 * borderW;
    CGFloat imageH = oldImage.size.height + 2 * borderW;
    // 新图片
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    //4, 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.00);
    //5, 画大图
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    //6, 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //7, 添加路径到上下文
    CGContextAddPath(ctx, path.CGPath);
    // 设置大圆的颜色
    [color set];
    //8,渲染
    CGContextFillPath(ctx);
    
    CGRect clipR = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
    //9, 画内切圆
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    //10, 设置裁剪区域
    [clipPath addClip];
    
    //11,将图片加载到裁剪区
    [oldImage drawAtPoint:CGPointMake(borderW, borderW)];
    
    //12,获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //13,关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
/** 
 截屏
 */
+ (instancetype)imageWithCaptureView:(UIView *)view
{
    // 1,开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.00);
    
    // 2,获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3,将控制器的图层渲染到上下文， 图层只能用渲染 不能用Draw
    [view.layer renderInContext:ctx];
    
    // 4,获取截屏图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5, 关闭上下文
    UIGraphicsEndImageContext();
    
    
    return newImage;
}

@end
