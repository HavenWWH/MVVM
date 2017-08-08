//
//  TabBar.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "TabBar.h"
#import "NSArray+Haven.h"


#define  BtnMagin 10
@interface TabBar()

@property (nonatomic, strong) UIButton *postBtn;
@property (nonatomic, strong) UILabel *midLable;
@end

@implementation TabBar

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    // 创建中间的按钮
    [self middlepostBtn];
  
    
}

#pragma mark -------- 中间按钮 ---------
- (void)middlepostBtn
{
    self.postBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.postBtn setBackgroundImage: [UIImage imageNamed: @"post_normal"] forState: UIControlStateNormal];
    [self.postBtn addTarget: self action:@selector(postBtnClick) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: self.postBtn];
    
    self.midLable = [[UILabel alloc] init];
    self.midLable.text = @"发布";
    self.midLable.textAlignment = NSTextAlignmentCenter;
    self.midLable.size = CGSizeMake(60, 21);
    self.midLable.font = SYSTEMFONT(11.0);
    self.midLable.textColor = [UIColor orangeColor];
    [self addSubview: self.midLable];
}

- (void)postBtnClick
{
    if ([self.mydelegate respondsToSelector:@selector(clickPostBtnWithTabBar:)]) {
        [self.mydelegate clickPostBtnWithTabBar: self];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.postBtn.size = CGSizeMake(self.postBtn.currentBackgroundImage.size.width, self.postBtn.currentBackgroundImage.size.width);

    NSInteger tabBarBtnCount = [NSArray arrayFromArray: self.subviews withClassStr:@"UITabBarButton"].count; 
    
    self.postBtn.centerX = self.centerX;
    self.postBtn.centerY = self.height * 0.5 - self.postBtn.currentBackgroundImage.size.height * 0.5;
    
    self.midLable.centerX = self.postBtn.centerX;
    self.midLable.y = CGRectGetMaxY(self.postBtn.frame); //self.height * 0.5;
    
    CGFloat btnWidth = KScreenWidth / (double)(tabBarBtnCount + 1);
    int index = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")] ) {
            view.width = btnWidth;
            view.x = index*btnWidth;
            index++;
            if (index == (tabBarBtnCount/2.0)) {
                index++;
            }
        }
    }
//    [self bringSubviewToFront: self.postBtn];
    
}


/**
 * 让中间按钮超过tabBar部分也会响应,  通过点的坐标系转换实现
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 判断当前是否处在tabBar的根控制器,  seld.Hiden 为NO, 表示处在根控制器
    if (!self.hidden) {
        // 将坐标系Btn上
        CGPoint newPoint = [self convertPoint: point toView: self.postBtn];
        // 判断当前点在Btn上, 返回Btn
        if ([self.postBtn pointInside: newPoint withEvent: event]) {
            return self.postBtn;
        }else{
            return  [super hitTest: point withEvent: event];
        }
    }else{
        return  [super hitTest: point withEvent: event];
    }
}
@end

