//
//  HomeTableViewCell.m
//  MVVM
//
//  Created by Haven on 2017/7/28.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeTableModel.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)createHomeTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed: @"HomeTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setHomeTableModel:(HomeTableModel *)homeTableModel
{
    _homeTableModel = homeTableModel;
    self.textLabel.text = homeTableModel.title;
}
@end
