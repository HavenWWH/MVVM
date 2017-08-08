//
//  UIBarButtonItem+Haven.m
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "UIBarButtonItem+Haven.h"

@implementation UIBarButtonItem (Haven)

- (UIBarButtonItem *)initWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action
{
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    [btn setBackgroundImage: [UIImage imageNamed: normalName] forState: UIControlStateNormal];
    [btn setBackgroundImage: [UIImage imageNamed: highlightImage] forState:UIControlStateHighlighted];
    [btn addTarget: btn action: action forControlEvents: UIControlEventTouchUpInside];
     btn.frame = CGRectMake(0, 0, btn.currentImage.size.width, btn.currentImage.size.height);
    return [self initWithCustomView: btn];
}

+ (UIBarButtonItem *)barButtonWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action
{
    return [[self alloc] initWithNormalImage: normalName highlightImage: highlightImage target: target action: action];
}

@end
