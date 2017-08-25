//
//  MeiTuanViewModel.h
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FoodCatetoryModel, FoodsModel;
@interface MeiTuanViewModel : NSObject

// 左边cell的数量
- (NSInteger)getFoodCategoryCellCount;
// 左边cell的模型
- (FoodCatetoryModel *)getFoodCategoryModelWithIndex: (NSInteger)index;


// 右边每组cell的数量
- (NSInteger)getFoodModelCellCountWithSection: (NSInteger)section;
// 右边cell的模型
- (FoodsModel *)getFoodModelWithIndexPath: (NSIndexPath  *)indexPath;

@end
