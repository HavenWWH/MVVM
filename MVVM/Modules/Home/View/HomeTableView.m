//
//  HomeTableView.m
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//  包含tableView单选,多选功能

#import "HomeTableView.h"
#import "HomeTableViewCell.h"
#import "HomeTableViewModel.h"

@interface HomeTableView()<UITableViewDelegate, UITableViewDataSource, HomeTableViewModelDelegate>
@property (nonatomic, strong) NSIndexPath *selecIndex;
@property (nonatomic, strong) NSMutableArray *selectIndexs;
@end

@implementation HomeTableView
- (NSMutableArray *)selectIndexs
{
    if (_selectIndexs == nil) {
        _selectIndexs = [NSMutableArray array];
    }
    return _selectIndexs;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
}

#pragma mark -- SET HomeTableViewCell ---
- (void)setHomeTableViewModel:(HomeTableViewModel *)homeTableViewModel
{
    _homeTableViewModel = homeTableViewModel;
    _homeTableViewModel.delegate = self;
}

- (void)setSelectType:(BOOL)selectType
{
    _selectType = selectType;
    self.selectIndexs = nil;
    self.selecIndex = nil;
    [self reloadData];
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.homeTableViewModel getCellCount];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [HomeTableViewCell createHomeTableViewCellWithTableView: tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.homeTableModel = [self.homeTableViewModel getModelWithIndex: indexPath.row];
    
    
    if (self.selectType) { // 单选
        if (self.selecIndex == indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else{ // 多选
        for (NSIndexPath *selectIndex in self.selectIndexs) {
            if (indexPath == selectIndex) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  cell 点击跳转到下一个控制器
     */
//    [self.homeTableViewModel didClickCellModelWithIndexPath: indexPath cellDidSelectBlock:^(id object) {
//        
//    }];
    

    if (self.selectType) { // 单选
        // 取消之前选中的Cell
        HomeTableViewCell *cell = [tableView cellForRowAtIndexPath: _selecIndex];
        cell.accessoryType = UITableViewCellAccessoryNone;
        // 选中最新的Cell
        HomeTableViewCell *newCell = [tableView cellForRowAtIndexPath: indexPath];
        if (newCell.accessoryType == UITableViewCellAccessoryCheckmark) {
            newCell.accessoryType = UITableViewCellAccessoryNone;
        }else{
            newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        self.selecIndex = indexPath;
        DLog(@"%@", [self.homeTableViewModel getModelWithIndex: indexPath.row]);
    }else{ // 多选
        // 选中最新的Cell
        HomeTableViewCell *moreCell = [tableView cellForRowAtIndexPath: indexPath];
        if (moreCell.accessoryType == UITableViewCellAccessoryCheckmark) {
            moreCell.accessoryType = UITableViewCellAccessoryNone;
            [self.selectIndexs removeObject: indexPath];
        }else{
            moreCell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self.selectIndexs addObject: indexPath];
        }

    }

    
}

#pragma mark -----    HomeTableViewModelDelegate -------
- (void)reloadTableView
{
    [self reloadData];
}



@end
