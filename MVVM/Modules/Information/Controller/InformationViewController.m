//
//  InformationViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "InformationViewController.h"
#import "ClickMeViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点我" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
}
- (void)rightButtonClick
{
    ClickMeViewController *clickView = [[ClickMeViewController alloc] init];
    [self.navigationController pushViewController: clickView animated: YES];
}
@end
