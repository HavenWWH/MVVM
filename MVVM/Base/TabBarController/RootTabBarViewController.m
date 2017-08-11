//
//  RootTabBarViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "TabBar.h"
#import "PostViewController.h"



@interface RootTabBarViewController ()<TabBarDelegate>
@property (weak, nonatomic) IBOutlet TabBar *tBar;

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tBar.mydelegate = self;
}
#pragma mark --------  TabBarDelegate ---------
- (void)clickPostBtnWithTabBar:(TabBar *)tabBar
{
    PostViewController *postVc = [[PostViewController alloc] init];
    [postVc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController: postVc animated: YES completion: nil];
}


@end
