//
//  BaseViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "BaseViewController.h"
#import "UIBarButtonItem+Haven.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIBarButtonItem *leftItem = [UIBarButtonItem barButtonWithNormalImage: @"back" highlightImage:@"back" target:self action:@selector(back)];
    UIBarButtonItem *nagetiveSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    nagetiveSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = @[nagetiveSpacer, leftItem];

}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
