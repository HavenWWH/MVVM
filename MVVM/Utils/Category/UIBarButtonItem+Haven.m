//
//  UIBarButtonItem+Haven.m
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "UIBarButtonItem+Haven.h"

@implementation UIBarButtonItem (Haven)

- (instancetype)initWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action
{
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed: normalName];
    [btn setBackgroundImage: image forState: UIControlStateNormal];
    [btn setBackgroundImage: [UIImage imageNamed: highlightImage] forState:UIControlStateHighlighted];
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
     btn.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    return [self initWithCustomView: btn];
}

+ (instancetype)barButtonWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action
{
    return [[self alloc] initWithNormalImage: normalName highlightImage: highlightImage target: target action: action];
}


@end
