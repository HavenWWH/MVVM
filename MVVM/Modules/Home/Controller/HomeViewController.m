//
//  HomeViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewModel.h"
#import "HomeTableView.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet HomeTableView *homeTableView;
@property (nonatomic, strong) HomeTableViewModel *homeTableViewModel;
@property (nonatomic, assign) BOOL selectType;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectType = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"复选" style:UIBarButtonItemStylePlain target: self action: @selector(rightButtonClick)];
    self.homeTableViewModel = [[HomeTableViewModel alloc] init];
    self.homeTableView.homeTableViewModel = self.homeTableViewModel;
    self.homeTableView.selectType = self.selectType;

}
- (void)rightButtonClick
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString: @"单选"]) {
        self.selectType = YES;
        self.navigationItem.rightBarButtonItem.title = @"复选";
    }else{
        self.selectType = NO;
        self.navigationItem.rightBarButtonItem.title = @"单选";
    }
    self.homeTableView.selectType = self.selectType;
    

}
@end
