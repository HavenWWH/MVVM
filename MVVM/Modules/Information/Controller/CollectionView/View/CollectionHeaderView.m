//
//  CollectionHeaderView.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "CollectionHeaderView.h"
#import "LWSCategorieModel.h"
@interface CollectionHeaderView()


@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end

@implementation CollectionHeaderView

-(void)setLwsCateModel:(LWSCategorieModel *)lwsCateModel
{
    _lwsCateModel = lwsCateModel;
    _titleLable.text = lwsCateModel.name;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//     self.lable = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, KScreenWidth - 80, 40)];
//    self.lable.textAlignment = NSTextAlignmentCenter;
//    self.lable.backgroundColor = RGBAColor(240, 240, 240, 0.4);
//    [self addSubview: self.lable];
//}

@end
