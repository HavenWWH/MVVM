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
#import "HavenHeaderView.h"


@interface HavenMyTableView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) HavenHeaderView *headerView;
@property (nonatomic, strong) HavenTableViewCell *tableViewCell;

@end

@implementation HavenMyTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.canScroll = YES;
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.delegate = self;
    self.dataSource = self;
    self.headerView = [HavenHeaderView createHeaderView];
    // 至今搞不懂这个尺寸为什么要这么适配,  到SE上面,  用屏幕宽度都不一样了
    if (iPhone6P) {
        self.headerView.frame = CGRectMake(0, 0, KScreenWidth, HeaderViewHeight - CustomNavHeight);
    }else if (iPhoneSE) {
        self.headerView.frame = CGRectMake(0, 0, 375, HeaderViewHeight + 100);
    }else{
        self.headerView.frame = CGRectMake(0, 0, KScreenWidth, HeaderViewHeight);
    }
    [self addSubview: self.headerView];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(scrollLeaveTop:) name: @"scrollLeaveTop" object: nil];
    
}


#pragma mark ------  <UITableViewDelegate, UITableViewDataSource> ------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        return cell;
    }else{
        self.tableViewCell = [HavenTableViewCell createHavenTableViewCellWithTableView: tableView];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return self.tableViewCell;
    }
    

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        CellHeaderView *cellHeaderView = [CellHeaderView createCellHeaderView];
        return cellHeaderView;
    }return [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 44;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return HeaderViewHeight;
    }else{
        return KScreenHeight - 64 - 44;
    }
}




-(void)setViewModel:(MyViewControllerViewModel *)viewModel
{
    _viewModel = viewModel;
}
#pragma mark -------  通知的方法  --------
- (void)scrollLeaveTop: (NSNotification *)notic
{
    self.canScroll = YES;
    self.tableViewCell.canScroll = NO;
}

#pragma mark ------   UIScrollViewDelegate  ------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetY = scrollView.contentOffset.y;
    CGFloat originY = 0;
//    DLog(@"scrollVy:%f",  scrollView.contentOffset.y);
    if (offSetY >= HeaderViewHeight - CustomNavHeight) {
        scrollView.contentOffset = CGPointMake(0, HeaderViewHeight - CustomNavHeight);
        if (self.canScroll) {
            self.canScroll = NO;
            self.tableViewCell.canScroll = YES;
        }
    }else{
        if (!_canScroll) {
            scrollView.contentOffset = CGPointMake(0, HeaderViewHeight - CustomNavHeight);
        }
    }
    if (offSetY < 0) {
        originY = offSetY;
        self.headerView.frame = CGRectMake(0, originY, KScreenWidth, HeaderViewHeight-originY);
    }
    
    
}
///允许同时识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
