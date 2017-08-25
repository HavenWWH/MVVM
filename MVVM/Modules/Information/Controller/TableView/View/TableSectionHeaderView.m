//
//  TableSectionHeaderView.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "TableSectionHeaderView.h"
#import "FoodCatetoryModel.h"

@interface TableSectionHeaderView()
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation TableSectionHeaderView
+ (instancetype)createTableSectionHeaderViewWithTableView:(UITableView *)tableView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TableSectionHeaderView" owner: nil options: nil] lastObject];
}

- (void)setFoodCategoryModel:(FoodCatetoryModel *)foodCategoryModel
{
    _foodCategoryModel = foodCategoryModel;
    _nameLable.text = foodCategoryModel.name;
}

@end
