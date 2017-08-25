//
//  TableSectionHeaderView.h
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodCatetoryModel;
@interface TableSectionHeaderView : UIView
+ (instancetype)createTableSectionHeaderViewWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) FoodCatetoryModel *foodCategoryModel;

@end
