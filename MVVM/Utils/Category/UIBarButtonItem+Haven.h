//
//  UIBarButtonItem+Haven.h
//  MVVM
//
//  Created by Haven on 2017/7/12.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Haven)
- (instancetype)initWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action;

+ (instancetype)barButtonWithNormalImage: (NSString *)normalName highlightImage: (NSString *)highlightImage target: (id)target action: (SEL)action;
@end
