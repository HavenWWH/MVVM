//
//  User.h
//  MVVM
//
//  Created by Haven on 2017/7/13.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, assign) int id;
@property (nonatomic, copy) NSString *headImage;
@property (nonatomic, copy) NSString *birthDate;
@property (nonatomic, copy) NSString *ishos;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSNumber *deviceType;
@property (nonatomic, strong) NSNumber *userType;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *isBothV;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *jslx;
@property (nonatomic, copy) NSString *lastCarId;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *hosStatus;
@property (nonatomic, copy) NSString *isDoc;
@property (nonatomic, copy) NSString *name;
// 群ID
@property (nonatomic, copy) NSString *gid;
// 最新订单ID
@property (nonatomic, copy) NSString *orderId;
// 地址模型数组
@property (nonatomic, strong) NSArray *locationArray;
@end
