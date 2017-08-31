//
//  AddShoppingCarTool.m
//  MVVM
//
//  Created by rzhy on 2017/8/30.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "AddShoppingCarTool.h"

@interface AddShoppingCarTool()

@property (nonatomic, strong) completionBlock completionBlock;

@end

@implementation AddShoppingCarTool
+ (void)addShoppingCarWithImage:(UIImage *)image startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint view: (UIView *)view completeBlock:(completionBlock)completionBlock
{
    return [[self alloc] addShoppingCarWithImage: image startPoint: startPoint endPoint: endPoint view: view completeBlock: completionBlock];
}

- (void)addShoppingCarWithImage:(UIImage *)image startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint view: (UIView *)view completeBlock:(completionBlock)completionBlock
{
    _completionBlock = completionBlock;
    //  创建动画层
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    //  位置及大小
    shapeLayer.frame = CGRectMake(startPoint.x - 20, startPoint.y - 20,  40, 40);
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.contents = (id)image.CGImage;
    
//    // 获取window的最顶层视图控制器
//    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
//    UIViewController *parentVC = rootVC;
//    while ((parentVC = rootVC.presentedViewController) != nil ) {
//        rootVC = parentVC;
//    }
//    while ([rootVC isKindOfClass:[UINavigationController class]]) {
//        rootVC = [(UINavigationController *)rootVC topViewController];
//    }
//
//    // 添加layer到顶层视图控制器上
//    [rootVC.view.layer addSublayer: shapeLayer];
    [view.layer addSublayer: shapeLayer];
    

    // 轨迹
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: startPoint];
    // 曲线
    [path addQuadCurveToPoint: endPoint controlPoint:CGPointMake(300, 50)];
    // 直线
//        [path addLineToPoint: endPoint];
    // 二次曲线，  需了解曲线运算
    //    [path addCurveToPoint: self.receiveButton.center controlPoint1:CGPointMake(300, 100) controlPoint2:CGPointMake(200, 300)];
    // 圆
    //    [path addArcWithCenter: self.view.center radius: 100 startAngle:0 endAngle:2 * M_PI  clockwise:YES];
    shapeLayer.path = path.CGPath;
    
    
    // 添加gui动画效果
    CAKeyframeAnimation *baseAnmation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    baseAnmation.duration = 1.0;
    // 设置为NO， 动画执行后保持执行后的状态。 默认是YES， 执行后返回初始状态
    baseAnmation.removedOnCompletion = NO;
    baseAnmation.fillMode = kCAFillModeForwards;
    //
    baseAnmation.path = path.CGPath;
    
    [shapeLayer addAnimation: baseAnmation forKey: nil];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [shapeLayer removeFromSuperlayer];
        if (self.completionBlock) {
            completionBlock();
        }
    });
}

@end
