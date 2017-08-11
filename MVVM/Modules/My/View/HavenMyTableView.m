//
//  HavenMyTableView.m
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HavenMyTableView.h"
#import "CellHeaderView.h"
#import "HavenTableViewCell.h"


@interface HavenMyTableView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation HavenMyTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.scrollEnabled = NO;
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.delegate = self;
    self.dataSource = self;
    
}


#pragma mark ------  <UITableViewDelegate, UITableViewDataSource> ------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HavenTableViewCell *cell = [HavenTableViewCell createHavenTableViewCellWithTableView: tableView];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CellHeaderView *cellHeaderView = [CellHeaderView createCellHeaderView];
    return cellHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KScreenHeight - self.tableHeaderView.frame.size.height - 44;
}



-(void)setViewModel:(MyViewControllerViewModel *)viewModel
{
    _viewModel = viewModel;
}

///允许同时识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark ------   UIScrollViewDelegate  ------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    DLog(@"tableViewOffset:%@", NSStringFromCGPoint(scrollView.contentOffset));
    CGFloat offsetY = scrollView.contentOffset.y;

    
}

@end
