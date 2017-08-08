//
//  HomeTableViewCell.h
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeTableModel;
@interface HomeTableViewCell : UITableViewCell

+ (instancetype)createHomeTableViewCellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) HomeTableModel *homeTableModel;

@end
