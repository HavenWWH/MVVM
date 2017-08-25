//
//  RightTableViewCell.h
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodsModel;
@interface RightTableViewCell : UITableViewCell

@property (nonatomic, strong) FoodsModel *foodModel;


+ (instancetype)createRightTableViewCelllWithTableView: (UITableView *)tabelView;
@end
