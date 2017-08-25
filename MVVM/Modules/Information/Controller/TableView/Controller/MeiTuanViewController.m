//
//  MeiTuanViewController.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MeiTuanViewController.h"
#import "MeiTuanTableView.h"
#import "MeiTuanViewModel.h"

@interface MeiTuanViewController ()
@property (weak, nonatomic) IBOutlet MeiTuanTableView *leftTableView;
@property (weak, nonatomic) IBOutlet MeiTuanTableView *rightTableView;
@property (nonatomic, strong) MeiTuanViewModel *mtViewModel;

@end

@implementation MeiTuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联动";
    self.mtViewModel = [[MeiTuanViewModel alloc] init];
    self.leftTableView.mtViewModel = self.mtViewModel;
    self.rightTableView.mtViewModel = self.mtViewModel;
    
}

@end
