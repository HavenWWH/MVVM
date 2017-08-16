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




@interface MyViewController ()<HavenNavigationBarDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet HavenMyTableView *tableView;
@property (nonatomic, strong) MyViewControllerViewModel *myViewModel;
@property (nonatomic, strong) HavenNavigationBar *havenNavigation;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.myViewModel = [[MyViewControllerViewModel alloc] init];
    self.tableView.viewModel = self.myViewModel;
    [self createCustomNavigationBar];
    
    //添加监听者
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
    

}

/** * 监听属性值发生改变时回调 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        DLog(@"%@",change[NSKeyValueChangeNewKey]);
        // 导航栏透明度
        CGFloat alpha = [change[NSKeyValueChangeNewKey] CGPointValue].y / (HeaderViewHeight - CustomNavHeight);
        self.havenNavigation.alpha = alpha;
    }
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark -----------  自定义导航栏及HeaderView -------------
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



- (void)dealloc
{
    [self.tableView removeObserver: self forKeyPath:@"contentOffset"];
}




@end
