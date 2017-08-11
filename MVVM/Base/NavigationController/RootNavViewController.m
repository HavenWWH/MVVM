//
//  RootNavViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "RootNavViewController.h"

@interface RootNavViewController ()

@end

@implementation RootNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark -------  设置导航栏外观  ----------
+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    [navBar setTintColor:[UIColor whiteColor]];
    
    navBar.barTintColor = [UIColor colorWithRed:55/255.0 green:200/255.0 blue:255/255.0 alpha:1.0];
    navBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18.0f],
                                   NSForegroundColorAttributeName : [UIColor whiteColor]};
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                      NSFontAttributeName : [UIFont systemFontOfSize:14.0f]
                                      } forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
