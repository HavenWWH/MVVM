//
//  LeftTableViewCell.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "FoodCatetoryModel.h"

@interface LeftTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLable;


@end

@implementation LeftTableViewCell
+ (instancetype)createleftTableViewCellWithTableView: (UITableView *)tabelView
{
    static NSString *ID =@"LeftTableViewCell";
    LeftTableViewCell *cell = [tabelView dequeueReusableCellWithIdentifier: ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner: nil options: nil] lastObject];
    }
    cell.backgroundColor = RGBColor(245, 245, 245);
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame: cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setFoodCatetoryModel:(FoodCatetoryModel *)foodCatetoryModel
{
    _foodCatetoryModel = foodCatetoryModel;
    _nameLable.text = foodCatetoryModel.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
