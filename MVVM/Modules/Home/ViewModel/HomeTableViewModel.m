//
//  HomeTableViewModel.m
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HomeTableViewModel.h"
#import "HTTPSTool.h"
#import "HomeTableModel.h"
#import <MJExtension.h>
#import "NextController.h"
#import "UIViewController+Haven.h"


@interface HomeTableViewModel()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HomeTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self requestData];
    }
    return self;
}

// 获取数据
- (void)requestData
{
    [HTTPSTool POSTRequestWithPath: GetRescueTitler params: nil success:^(NSDictionary * _Nonnull JSON) {
        self.dataArray = [HomeTableModel mj_objectArrayWithKeyValuesArray: JSON[@"data"][@"titleList"]];
        
        if ([self.delegate respondsToSelector:@selector(reloadTableView)]) {
            [self.delegate reloadTableView];
        }
        DLog(@"%@", self.dataArray);
    } failure:^(NSError * _Nonnull error) {
    }];
}

#pragma mark -------- cell/section Count
- (NSInteger)getCellCount
{
    return self.dataArray.count;
}

- (HomeTableModel *)getModelWithIndex: (NSInteger)index;
{
    return self.dataArray[index];
}

#pragma mark -------- didClickTableView ---------
- (void)didClickCellModelWithIndexPath:(NSIndexPath *)indexPath cellDidSelectBlock:(CellDidSelectBlock)cellDidSelectBlock
{
    _cellDidSelectBlock = cellDidSelectBlock;
    NextController *nextVc = [[NextController alloc] init];
    [[UIViewController getCurrentViewControllerVc].navigationController pushViewController: nextVc animated: YES];
}


@end
