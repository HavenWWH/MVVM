//
//  CollectionHeaderView.h
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *collectionHeaderViewId = @"collectionHeaderView";
@class LWSCategorieModel;
@interface CollectionHeaderView : UICollectionReusableView
@property (nonatomic, strong) LWSCategorieModel *lwsCateModel;

@end
