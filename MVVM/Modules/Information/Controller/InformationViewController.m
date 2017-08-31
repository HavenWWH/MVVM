//
//  InformationViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "InformationViewController.h"
#import "ClickMeViewController.h"
#import "BezierPathControllerView.h"

@interface InformationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *bseButton;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"联动" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
}
- (void)rightButtonClick
{
    ClickMeViewController *clickView = [[ClickMeViewController alloc] init];
    [self.navigationController pushViewController: clickView animated: YES];
}

// 贝塞尔曲线
- (IBAction)bseClick {
    BezierPathControllerView *bVc = [[BezierPathControllerView alloc] init];
    [self.navigationController pushViewController: bVc  animated: YES];
    
}
@end
