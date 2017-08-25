//
//  LWSTableView.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LWSTableView.h"
#import "LWSTableViewCell.h"
#import "LiWuShuoViewModel.h"
#import "LWSCollectionView.h"

@interface LWSTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LWSTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark -------- UITableViewDelegate, UITableViewDataSource ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.lwsViewModel getCategoriesCellCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWSTableViewCell *cell = [LWSTableViewCell createLWSTableViewCellCellWithTableView: tableView];
    
    cell.lwsCatEgoriesModle = [self.lwsViewModel getCategoriesModelWithIndex: indexPath.row];
    cell.backgroundColor = RGBColor(245, 245, 245);
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame: cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UIView *view in self.superview.subviews) {
        if ([view isKindOfClass: [UICollectionView class]]) {
            LWSCollectionView *collectionView = (LWSCollectionView *)view;
            [collectionView scrollToItemAtIndexPath: [NSIndexPath indexPathForItem:0 inSection: indexPath.row] atScrollPosition:UICollectionViewScrollPositionTop animated: YES];
        }
    }
}

- (void)setLwsViewModel:(LiWuShuoViewModel *)lwsViewModel
{
    _lwsViewModel = lwsViewModel;
    [self selectRowAtIndexPath: [ NSIndexPath indexPathForRow:0 inSection:0] animated: YES scrollPosition: UITableViewScrollPositionTop];
}
@end
