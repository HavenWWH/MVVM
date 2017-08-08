//
//  HomeTableViewModel.h
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CellDidSelectBlock)(id object);

@protocol HomeTableViewModelDelegate <NSObject>

- (void)reloadTableView;

@end

@class HomeTableModel;
@interface HomeTableViewModel : NSObject

@property (nonatomic, strong) CellDidSelectBlock cellDidSelectBlock;
@property (nonatomic, weak) id<HomeTableViewModelDelegate> delegate;

- (NSInteger)getCellCount;
- (HomeTableModel *)getModelWithIndex: (NSInteger)index;
- (void)didClickCellModelWithIndexPath:(NSIndexPath *)indexPath cellDidSelectBlock: (CellDidSelectBlock)cellDidSelectBlock;

@end
