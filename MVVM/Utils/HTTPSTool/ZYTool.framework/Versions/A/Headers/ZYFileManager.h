//
//  ZYFileManager.h
//
//  Created by ZY on 16/8/3.
//  Copyright © 2016年 ZY. All rights reserved.
//
//  文件管理

#import <Foundation/Foundation.h>

@interface ZYFileManager : NSObject

/**
 * 获取沙盒文件目录
 *  @return 系统文件夹路径
 */
+ (NSString *)getDocumentDirectory;
+ (NSString *)getLibraryDirectory;
+ (NSString *)getCachesDirectory;
+ (NSString *)getPreferencePanesDirectory;
+ (NSString *)getTmpDirectory;

/**
 * 获取沙盒文件路径
 *  @param fileName 文件名
 *  @return 文件路径
 */
+ (NSString *)getDocumentDirectoryWithFileName:(NSString *)fileName;
+ (NSString *)getLibraryDirectoryWithFileName:(NSString *)fileName;
+ (NSString *)getCachesDirectoryWithFileName:(NSString *)fileName;
+ (NSString *)getPreferencePanesDirectoryWithFileName:(NSString *)fileName;
+ (NSString *)getTmpDirectoryWithFileName:(NSString *)fileName;

/**
 * 获取文件大小
 *  @param path 文件路径
 *  @return 文件大小
 */
+ (float)sizeWithFilePath:(NSString *)path;
/**
 * 获取指定路径下的所有文件
 *  @param dirPath 文件路径
 *  @return 所有文件
 */
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
/**
 * 删除指定路径下的文件
 *  @param path 文件路径
 *  @return YES/NO
 */
+ (BOOL)deleteFinderAndFileWithPath:(NSString *)path;
/**
 * 清空指定目录下文件
 *  @param dirPath 文件路径
 *  @return YES/NO
 */
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

@end
