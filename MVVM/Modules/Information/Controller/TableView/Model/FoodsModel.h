//
//  FoodsModel.h
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodsModel : NSObject
@property (nonatomic, copy) NSString *foodId;
@property (nonatomic, copy) NSString *praise_content; // 赞
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *month_saled_content; // 月售
@property (nonatomic, copy) NSString *picture; // 图片
@end
