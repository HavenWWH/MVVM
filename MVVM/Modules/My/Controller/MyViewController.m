//
//  MyViewController.m
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MyViewController.h"
#import "MyViewControllerViewModel.h"
#import "HavenNavigationBar.h"
#import "HavenMyTableView.h"

#define CustomNavHeight 64

#define HeaderViewHeight 200

@interface MyViewController ()<HavenNavigationBarDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet HavenMyTableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (nonatomic, strong) MyViewControllerViewModel *myViewModel;
@property (nonatomic, strong) HavenNavigationBar *havenNavigation;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.delegate = self;
    self.myViewModel = [[MyViewControllerViewModel alloc] init];
    self.tableView.viewModel = self.myViewModel;
    [self createCustomNavigationBar];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark -----------  自定义导航栏 -------------
- (void)createCustomNavigationBar
{
    self.havenNavigation = [HavenNavigationBar createHavenNavigationBar];
    self.havenNavigation.delegate = self;
    self.havenNavigation.alpha = 0;
    [self.view addSubview: self.havenNavigation];
}

#pragma mark ------ HavenNavigationBarDelegate ------
- (void)navigationBar:(HavenNavigationBar *)navigationBar buttonClick:(NavigationBarButtonType)navigationButton
{
    switch (navigationButton) {
        case NavigationBarBackButton:
            [self.navigationController popViewControllerAnimated: YES];
            break;
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
    CGFloat alpha = offSetY / (HeaderViewHeight - CustomNavHeight);
    
    DLog(@"scrollVy:%f  alp%f",  scrollView.contentOffset.y, alpha);
    CGFloat originY = 0;
    if (offSetY >= HeaderViewHeight - CustomNavHeight) {
        originY = - (HeaderViewHeight - CustomNavHeight);
    }
    if (offSetY <= 0) {
        
    }
    self.havenNavigation.alpha = alpha;
}
@end
