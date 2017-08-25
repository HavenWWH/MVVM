//
//  LWSCollectionViewCell.m
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LWSCollectionViewCell.h"
#import "LWSSubModle.h"
#import <UIImageView+WebCache.h>

@interface LWSCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *namelable;
@end

@implementation LWSCollectionViewCell
+ (NSString *)registerName
{
    return @"LWSCollectionViewCell";
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLwsSubModel:(LWSSubModle *)lwsSubModel
{
    _lwsSubModel = lwsSubModel;
    [_iconImage sd_setImageWithURL: [NSURL URLWithString: lwsSubModel.icon_url] placeholderImage: [UIImage imageNamed:@"headerViewImage.jpg"]];
    _namelable.text = lwsSubModel.name;
}

@end
