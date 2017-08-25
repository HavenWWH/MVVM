//
//  RightTableViewCell.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "RightTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "FoodsModel.h"

@interface RightTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *monthSaleLable;

@property (weak, nonatomic) IBOutlet UILabel *likeCountLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@end

@implementation RightTableViewCell

+ (instancetype)createRightTableViewCelllWithTableView: (UITableView *)tabelView
{
    static NSString *ID =@"RightTableViewCell";
    RightTableViewCell *cell = [tabelView dequeueReusableCellWithIdentifier: ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RightTableViewCell" owner: nil options: nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}
- (void)setFoodModel:(FoodsModel *)foodModel
{
    _foodModel = foodModel;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString: foodModel.picture] placeholderImage:[UIImage imageNamed: @"headerViewImage.jpg"]];
    _nameLable.text = foodModel.name;
    _monthSaleLable.text  = foodModel.month_saled_content;
    _likeCountLable.text = foodModel.praise_content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
