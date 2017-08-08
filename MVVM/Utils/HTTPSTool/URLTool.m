//
//  URLTool.m
//
//  Created by rzhy on 16/9/29.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "URLTool.h"

static NSString * const baseUrlString = URL_main;
static NSString * const imageBaseString = URL_main;

@implementation URLTool

#pragma mark - data
+ (NSString *)dataURLStringWithPathString:(NSString *)string {
    if (!string.length) return nil;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (![string hasPrefix:@"http"])
        string = [NSString stringWithFormat:@"%@/ws%@", baseUrlString, string];
    return string;
}

#pragma mark - fileDownload
+ (NSURLRequest *)fileDownloadURLRequestWithPathString:(NSString *)string {
    if (!string.length) return nil;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (![string hasPrefix:@"http"])
        string = [baseUrlString stringByAppendingString:string];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
}

#pragma mark - fileSend
+ (NSString *)fileSendURLStringWithPathString:(NSString *)string {
    if (!string.length) return nil;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (![string hasPrefix:@"http"])
        string = [NSString stringWithFormat:@"%@/ws%@", baseUrlString, string];
    return string;
}

#pragma mark - image
+ (NSURL *)imageURLStringWithPathString:(NSString *)string {
    if (!string.length) return nil;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
    if (![string hasPrefix:@"http"])
        string = [NSString stringWithFormat:@"%@/%@", imageBaseString, string];
    return [NSURL URLWithString:string];
}

#pragma mark - web
+ (NSURL *)webURLStringWithPathString:(NSString *)string token:(NSString *)token {
    if (!string.length) return nil;
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (![string hasPrefix:@"http"]) string = [baseUrlString stringByAppendingString:string];
    if (token) {
        if ([string rangeOfString:@"?"].length)
            string = [NSString stringWithFormat:@"%@&%@", string, token];
        else
            string = [NSString stringWithFormat:@"%@?%@", string, token];
    }
//    NSLog(@"%@", string);
    return [NSURL URLWithString:string];
}

@end
