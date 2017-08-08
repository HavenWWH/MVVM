//
//  ZYUUIDManager.h
//
//  Created by ZY on 16/7/7.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  设备的唯一标识(UUID/Mac地址)

#import <Foundation/Foundation.h>

@interface ZYUUIDManager : NSObject

// Save
+ (void)saveUUID:(NSString *)uuid;
// Get
+ (NSString *)getUUID;
// Delete
+ (void)deleteUUID;
// GUID
+ (NSString *)getGUID;

@end
