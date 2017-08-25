//
//  LiWuShuoViewModel.h
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LWSCategorieModel, LWSSubModle;
@interface LiWuShuoViewModel : NSObject

- (NSInteger)getCategoriesCellCount;
- (LWSCategorieModel *)getCategoriesModelWithIndex: (NSInteger) index;


- (NSInteger)getSubCategoriesCellCountWithIndex: (NSInteger)index;


- (LWSSubModle *)getSubCategoriesModelWithIndex: (NSIndexPath *)indexPath;
@end
