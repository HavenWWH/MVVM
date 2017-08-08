//
//  TabBar.h
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>

- (void)clickPostBtnWithTabBar: (TabBar *)tabBar;

@end

@interface TabBar : UITabBar
@property (nonatomic, weak) id<TabBarDelegate> mydelegate;
@end
