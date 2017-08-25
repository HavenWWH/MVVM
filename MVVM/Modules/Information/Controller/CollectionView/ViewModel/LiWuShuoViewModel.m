//
//  LiWuShuoViewModel.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LiWuShuoViewModel.h"
#import "MJExtension.h"
#import "LWSSubModle.h"
#import "LWSCategorieModel.h"

@interface LiWuShuoViewModel()

@property (nonatomic, strong) NSArray *lwsCategoriesArray;


@end

@implementation LiWuShuoViewModel
- (NSArray *)lwsCategoriesArray
{
    if (_lwsCategoriesArray == nil) {
        _lwsCategoriesArray = [[NSArray alloc] init];
    }
    return _lwsCategoriesArray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self requestData];
    }
    return self;
}

#pragma mark ------ 获取数据 ------
- (void)requestData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"liwushuo.json" ofType: nil];
    
    NSData *data = [NSData dataWithContentsOfFile: path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error: nil];
    
    self.lwsCategoriesArray = (NSArray *)[LWSCategorieModel mj_objectArrayWithKeyValuesArray: dict[@"data"][@"categories"]];
    
    DLog(@"lwsCategoriesArray:%@ ", self.lwsCategoriesArray);
    
}


#pragma mark --------    public -----------
- (NSInteger)getCategoriesCellCount
{
    return self.lwsCategoriesArray.count;
}


- (LWSCategorieModel *)getCategoriesModelWithIndex: (NSInteger) index
{
    LWSCategorieModel *model = self.lwsCategoriesArray[index];
    return  model;
}


- (NSInteger)getSubCategoriesCellCountWithIndex: (NSInteger)index;
{
    LWSCategorieModel *model = self.lwsCategoriesArray[index];
    return model.subcategories.count;
}

- (LWSSubModle *)getSubCategoriesModelWithIndex: (NSIndexPath *)indexPath
{
    LWSCategorieModel *model = self.lwsCategoriesArray[indexPath.section];
    LWSSubModle *lwsSubModel = model.subcategories[indexPath.row];
    return lwsSubModel;
}
@end
