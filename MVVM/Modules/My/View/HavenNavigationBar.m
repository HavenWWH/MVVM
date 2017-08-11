//
//  HavenNavigationBar.m
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HavenNavigationBar.h"


@interface HavenNavigationBar()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@end


@implementation HavenNavigationBar

+ (instancetype)createHavenNavigationBar;
{
    return [[[NSBundle mainBundle] loadNibNamed: @"HavenNavigationBar" owner: nil options: nil] lastObject];
}


#pragma mark ------  导航栏事件  ------
- (IBAction)navigationButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(navigationBar:buttonClick:)]) {
        [self.delegate navigationBar: self buttonClick: sender.tag];
    }
}

- (void)drawRect:(CGRect)rect
{
    self.frame = CGRectMake(0, 0, KScreenWidth, 64);
}

@end
