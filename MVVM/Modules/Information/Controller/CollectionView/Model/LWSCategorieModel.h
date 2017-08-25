//
//  LWSCategorieModel.h
//  MVVM
//
//  Created by Haven on 2017/8/25.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWSCategorieModel : NSObject
@property (nonatomic, copy) NSString *icon_url;
@property (nonatomic, copy) NSString *idenId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) NSArray *subcategories;

@end
