//
//  MeiTuanTableView.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MeiTuanTableView.h"
#import "MeiTuanViewModel.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"
#import "TableSectionHeaderView.h"


@interface MeiTuanTableView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) BOOL isUpScroll;
@end

@implementation MeiTuanTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
 
}

- (void)setMtViewModel:(MeiTuanViewModel *)mtViewModel
{
    _mtViewModel = mtViewModel;
    if (self.tag == 1) {
        [self selectRowAtIndexPath: [NSIndexPath indexPathForRow: 0 inSection: 0] animated: YES scrollPosition: UITableViewScrollPositionTop];
    }
}


#pragma mark ------  UITableViewDelegate, UITableViewDataSource ------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.tag == 1) {
        return 1;
    }
    return [self.mtViewModel getFoodCategoryCellCount];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.tag == 1) {
        return [self.mtViewModel getFoodCategoryCellCount];
    }
    
    return [self.mtViewModel getFoodModelCellCountWithSection: section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tag == 1) {
        LeftTableViewCell *leftCell = [LeftTableViewCell createleftTableViewCellWithTableView: tableView];
        leftCell.foodCatetoryModel = [self.mtViewModel getFoodCategoryModelWithIndex: indexPath.row];
        return leftCell;
    }else{
        RightTableViewCell *rightCell = [RightTableViewCell createRightTableViewCelllWithTableView: tableView];
        rightCell.foodModel = [self.mtViewModel getFoodModelWithIndexPath: indexPath];
        return rightCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tag == 1) {
        MeiTuanTableView *rightTableView = (MeiTuanTableView *)[self.superview viewWithTag: 2];
        [rightTableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: 0 inSection:indexPath.row] atScrollPosition: UITableViewScrollPositionTop animated: YES];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.tag == 2) {
        TableSectionHeaderView *headerView = [TableSectionHeaderView createTableSectionHeaderViewWithTableView: tableView];
        headerView.foodCategoryModel = [self.mtViewModel getFoodCategoryModelWithIndex: section];
        return headerView;
    }return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.tag == 2) {
        return 40;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tag == 2) {
        return 90;
    }else{
        return 60;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastoffY = 0;
    if (self.tag == 2) {
        self.isUpScroll = scrollView.contentOffset.y > lastoffY;
        lastoffY = scrollView.contentOffset.y;
    }
}
// section的HeadView即将显示
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    // tableView向下滚
    if (self.tag == 2 && !self.isUpScroll && (self.dragging || self.decelerating)) {
        MeiTuanTableView *leftTableView = (MeiTuanTableView *)[self.superview viewWithTag: 1];
        [leftTableView selectRowAtIndexPath: [NSIndexPath indexPathForRow: section inSection:0] animated: YES scrollPosition: UITableViewScrollPositionTop];
    }
 
}
// section的HeadView结束
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // 向上滚
    if (self.tag == 2 && self.isUpScroll && (self.dragging || self.decelerating)) {
        MeiTuanTableView *leftTableView = (MeiTuanTableView *)[self.superview viewWithTag: 1];
        [leftTableView selectRowAtIndexPath: [NSIndexPath indexPathForRow: section + 1 inSection:0] animated: YES scrollPosition: UITableViewScrollPositionTop];
    }
}
@end
