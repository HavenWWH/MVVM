//
//  BezierPathControllerView.m
//  MVVM
//
//  Created by rzhy on 2017/8/30.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "BezierPathControllerView.h"
#import "AddShoppingCarTool.h"
#import "OvalProgress.h"

@interface BezierPathControllerView ()
@property (weak, nonatomic) IBOutlet UIButton *receiveButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *tipLable;
@property (nonatomic, strong) OvalProgress *ovalProgress;
@end

@implementation BezierPathControllerView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"贝塞尔曲线动画";
    ViewRadius(self.tipLable, 10);
    DLog(@"receiveButton%@, sendButton%@", NSStringFromCGRect(self.receiveButton.frame), NSStringFromCGRect(self.sendButton.frame));
    
}
- (IBAction)send {
    // 工具类创建动画
    [self createCarShopping];
    
    // 圆形进度条
    self.ovalProgress = [[OvalProgress alloc] initOvalProgressWith: 0.7];
    [self.view addSubview: self.ovalProgress];
    
    
}
- (IBAction)receive {
    [self.ovalProgress setProgressValue: 0.9];
}


// 工具类创建动画
- (void)createCarShopping
{
    [AddShoppingCarTool addShoppingCarWithImage: [UIImage imageNamed:@"post_normal2.png"] startPoint:self.sendButton.center endPoint:self.receiveButton.center view: self.view  completeBlock:^{
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        // 变化区间
        animation.fromValue = [NSNumber numberWithFloat:1.0];
        animation.toValue = [NSNumber numberWithFloat:0.5];
        
        animation.duration = 0.1;
        // 颤抖两次
        animation.repeatCount = 2;
        // 是否执行逆动画
        animation.autoreverses = YES;
        // 动画执行的速度变化
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.tipLable.layer addAnimation: animation forKey: nil];
    }];

}
@end
