//
//  HavenNavigationBar.h
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NavigationBarBackButton,
    NavigationBarSearchButton,
    NavigationBarMoreButton
} NavigationBarButtonType;

@class HavenNavigationBar;
@protocol HavenNavigationBarDelegate <NSObject>

- (void)navigationBar: (HavenNavigationBar *)navigationBar buttonClick: (NavigationBarButtonType)navigationButton;
@end

@interface HavenNavigationBar : UIView
@property (nonatomic, weak) id<HavenNavigationBarDelegate> delegate;

+ (instancetype)createHavenNavigationBar;

@end
