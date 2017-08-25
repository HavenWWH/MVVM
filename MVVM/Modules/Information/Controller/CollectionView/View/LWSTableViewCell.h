//
//  LeftTableViewCell.h
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LWSCategorieModel;
@interface LWSTableViewCell : UITableViewCell
+ (instancetype)createLWSTableViewCellCellWithTableView: (UITableView *)tabelView;

@property (nonatomic, strong) LWSCategorieModel *lwsCatEgoriesModle;

@end
