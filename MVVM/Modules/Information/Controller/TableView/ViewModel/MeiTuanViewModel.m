//
//  MeiTuanViewModel.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MeiTuanViewModel.h"
#import "FoodCatetoryModel.h"
#import "FoodsModel.h"
#import "MJExtension.h"


@interface MeiTuanViewModel()
@property (nonatomic, strong) NSArray *foodCatetoryModelArray;

@end

@implementation MeiTuanViewModel
- (NSArray *)foodCatetoryModelArray{
    if (_foodCatetoryModelArray == nil) {
        _foodCatetoryModelArray = [[NSArray alloc] init];
    }
    return  _foodCatetoryModelArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 获取数据
        [self requestData];
    }
    return self;
}

#pragma mark ---- 获取数据 ----
- (void)requestData
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"meituan" ofType: @"json"];
    
    NSData *data = [NSData dataWithContentsOfFile: path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error: nil];
    
    NSArray *array = dict[@"data"][@"food_spu_tags"];
    
    // 转模型
    self.foodCatetoryModelArray = (NSArray *)[FoodCatetoryModel mj_objectArrayWithKeyValuesArray: array];
}

#pragma mark -------- cell/section Count
- (NSInteger)getFoodCategoryCellCount
{
    return self.foodCatetoryModelArray.count;
}

- (FoodCatetoryModel *)getFoodCategoryModelWithIndex: (NSInteger)index;
{
    return self.foodCatetoryModelArray[index];
}

- (NSInteger)getFoodModelCellCountWithSection: (NSInteger)section
{
    FoodCatetoryModel *foodCatetoryModel = self.foodCatetoryModelArray[section];
    return foodCatetoryModel.spus.count;
}

- (FoodsModel *)getFoodModelWithIndexPath: (NSIndexPath  *)indexPath
{
    FoodCatetoryModel *foodCatetoryModel = self.foodCatetoryModelArray[indexPath.section];
    FoodsModel *foodModel = foodCatetoryModel.spus[indexPath.row];
    return foodModel;
}
@end
