//
//  LWSCollectionViewCell.h
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *cellId = @"LWScell";


@class LWSSubModle;
@interface LWSCollectionViewCell : UICollectionViewCell

+ (NSString *)registerName;

@property (nonatomic, strong) LWSSubModle *lwsSubModel;

@end
