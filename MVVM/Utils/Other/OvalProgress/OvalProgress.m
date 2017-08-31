//
//  OvalProgress.m
//  MVVM
//
//  Created by rzhy on 2017/8/31.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "OvalProgress.h"

@interface OvalProgress()
@property (nonatomic, strong) CAShapeLayer *shaperlayer;
@property (nonatomic, strong) CABasicAnimation *animation;
@property (nonatomic, strong) UILabel *lable;
@end

@implementation OvalProgress

- (instancetype)initOvalProgressWith: (CGFloat)progressValue
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, 200, 200);
        [self createOvalProgress: progressValue];
    }
    return self;
}

- (void)createOvalProgress: (CGFloat)progressValue
{
    CAShapeLayer *baseshaperlayer = [CAShapeLayer layer];
    baseshaperlayer.strokeColor = RGBColor(245, 245, 245).CGColor;
    baseshaperlayer.fillColor = [UIColor clearColor].CGColor;
    baseshaperlayer.lineWidth = 5;
    baseshaperlayer.strokeStart = 0;
    baseshaperlayer.strokeEnd = 1;
    [self.layer addSublayer: baseshaperlayer];
    
    UIBezierPath *basepath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, self.width, self.height)];
    baseshaperlayer.path = basepath.CGPath;
    
    self.shaperlayer = [CAShapeLayer layer];
    self.shaperlayer.strokeColor = [UIColor orangeColor].CGColor;
    self.shaperlayer.fillColor = [UIColor clearColor].CGColor;
    self.shaperlayer.lineWidth = 5;
    self.shaperlayer.strokeStart = 0;
    self.shaperlayer.strokeEnd = 1;
    [self.layer addSublayer: self.shaperlayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, self.width, self.height)];
    self.shaperlayer.path = path.CGPath;
    
    
    self.animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    self.animation.fromValue = @(0);
    self.animation.toValue = @(progressValue);
    self.animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    self.animation.duration = 2;
    self.animation.removedOnCompletion = NO;
    self.animation.fillMode = kCAFillModeForwards;
    
    [self.shaperlayer addAnimation: self.animation forKey: nil];
    
    self.lable = [[UILabel alloc] init];
    self.lable.size = CGSizeMake(self.width / 2.0, self.height / 2.0);
    self.lable.center = self.center;
    CGFloat progress = progressValue * 100;
    self.lable.text = [NSString stringWithFormat:@"%.2f%%", progress];
    self.lable.textAlignment = NSTextAlignmentCenter;
    [self addSubview: self.lable];
    

}


- (void)setProgressValue: (CGFloat)progressValue
{
    [self.shaperlayer removeFromSuperlayer];
    self.lable.text = @"";
    [self createOvalProgress: progressValue];
    
}
@end
