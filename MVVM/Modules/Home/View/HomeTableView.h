//
//  HomeTableView.h
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeTableViewModel;
@interface HomeTableView : UITableView
@property (nonatomic, strong)  HomeTableViewModel *homeTableViewModel;
@property (nonatomic, assign) BOOL selectType;
@end
