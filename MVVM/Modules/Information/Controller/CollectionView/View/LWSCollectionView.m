//
//  LWSCollectionView.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LWSCollectionView.h"
#import "LWSCollectionViewCell.h"
#import "CollectionHeaderView.h"
#import "LiWuShuoViewModel.h"
#import "LWSCategorieModel.h"
#import "LWSTableView.h"

@interface LWSCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) BOOL isUpScroll;
@end

@implementation LWSCollectionView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
    // 注册collectionView的headerView
    [self registerNib: [UINib nibWithNibName: @"CollectionHeaderView" bundle: nil] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderViewId];
}

- (void)setLswViewModel:(LiWuShuoViewModel *)lwsViewModel
{
    _lwsViewModel = lwsViewModel;
}


#pragma mark ------- UICollectionViewDelegate, UICollectionViewDataSource ---------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.lwsViewModel getCategoriesCellCount];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.lwsViewModel getSubCategoriesCellCountWithIndex: section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LWSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: cellId forIndexPath: indexPath];
    LWSSubModle *subModel = [self.lwsViewModel getSubCategoriesModelWithIndex: indexPath];
    cell.lwsSubModel = subModel;
    return  cell;
}

// 创建collectionView的自定义headerView
- collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(nonnull NSString *)kind atIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (kind ==  UICollectionElementKindSectionHeader) {
        CollectionHeaderView *collectionHeaderView = [collectionView  dequeueReusableSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier: collectionHeaderViewId forIndexPath: indexPath];
        collectionHeaderView.backgroundColor = [UIColor clearColor];
       
        LWSCategorieModel *lwsCModel = [self.lwsViewModel getCategoriesModelWithIndex: indexPath.section];
        collectionHeaderView.lwsCateModel = lwsCModel;
        return collectionHeaderView;
    }return nil;
   
    
}
// items的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

// headerView显示的时候
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isUpScroll && (self.dragging || self.decelerating)) {
        [self selectTableViewRowWithIndex: indexPath.section];
    }
    
}

// headerView隐藏的时候
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    if (self.isUpScroll && (self.dragging || self.decelerating)) {
        [self selectTableViewRowWithIndex: indexPath.section + 1];
    }
}

- (void)selectTableViewRowWithIndex: (NSInteger)index
{
    for (UIView *view in self.superview.subviews) {
        if ([view isKindOfClass: [UITableView class]]) {
            LWSTableView *tableView = (LWSTableView *)view;
            [tableView selectRowAtIndexPath: [NSIndexPath indexPathForRow: index inSection: 0] animated: YES scrollPosition: UITableViewScrollPositionTop];
        }
    }

}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastOffY = 0;
    self.isUpScroll = scrollView.contentOffset.y > lastOffY;
    lastOffY = scrollView.contentOffset.y;

}

// 根据section设置collectionHeaderView的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return CGSizeMake(100, 100);
//    }return CGSizeMake(100, 44);
//    
//}


@end
