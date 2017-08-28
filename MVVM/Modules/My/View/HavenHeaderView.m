//
//  HavenHeaderView.m
//  MVVM
//
//  Created by Haven on 2017/8/16.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HavenHeaderView.h"

@interface  HavenHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end

@implementation HavenHeaderView

+ (instancetype)createHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed: @"HavenHeaderView" owner: nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)layoutSubviews
{
}

@end
