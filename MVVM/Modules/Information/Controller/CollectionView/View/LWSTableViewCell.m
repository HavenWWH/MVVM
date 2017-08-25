//
//  LeftTableViewCell.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LWSTableViewCell.h"
#import "LWSCategorieModel.h"

@interface LWSTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLable;


@end

@implementation LWSTableViewCell
+ (instancetype)createLWSTableViewCellCellWithTableView: (UITableView *)tabelView
{
    static NSString *ID =@"LWSTableViewCell";
    LWSTableViewCell *cell = [tabelView dequeueReusableCellWithIdentifier: ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LWSTableViewCell" owner: nil options: nil] lastObject];
    }
    cell.backgroundColor = RGBColor(245, 245, 245);
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame: cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setLwsCatEgoriesModle:(LWSCategorieModel *)lwsCatEgoriesModle
{
    _lwsCatEgoriesModle = lwsCatEgoriesModle;
    _nameLable.text = lwsCatEgoriesModle.name;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
