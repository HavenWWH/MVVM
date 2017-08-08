//
//  URLTool.h
//
//  Created by Zy on 16/9/29.
//  Copyright © 2016年 Zy. All rights reserved.
//
//  URL头部/域名

#import <Foundation/Foundation.h>

@interface URLTool : NSObject

// data
+ (NSString *)dataURLStringWithPathString:(NSString *)string;

// fileDownload
+ (NSURLRequest *)fileDownloadURLRequestWithPathString:(NSString *)string;

// fileSend
+ (NSString *)fileSendURLStringWithPathString:(NSString *)string;

// image
+ (NSURL *)imageURLStringWithPathString:(NSString *)string;

// web
+ (NSURL *)webURLStringWithPathString:(NSString *)string token:(NSString *)token;

@end
