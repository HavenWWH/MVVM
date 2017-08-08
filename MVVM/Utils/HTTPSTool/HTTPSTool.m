//
//  HTTPTool.m
//
//  Created by Zy on 16/6/26.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "HTTPSTool.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import <XMLDictionary.h>
#import <ZYTool/ZYTool.h>

#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__);
#else
#define DLog(...)
#endif

typedef NS_ENUM(NSUInteger, HttpsRequest) {
    HttpsRequestPost    = 0,
    HttpsRequestGet
};

typedef NS_ENUM(NSUInteger, HttpsRequestDataType) {
    HttpsRequestDataTypeXML     = 0,
    HttpsRequestDataTypeJSON    = 1
};

typedef NS_ENUM(NSUInteger, HttpsLoadHUDType) {
    HttpsLoadHUDTypeShow    = 0,
    HttpsLoadHUDTypeHidden  = 1
};

static CGFloat const timeoutInterval = 30.0f;
static NSString * const SVStatus= @"Loading...";

@interface NSDictionary (Zy)

- (NSDictionary *)deleteNull;

@end

@implementation HTTPSTool

#pragma mark - DataRequest
#pragma mark JSON
+ (void)POSTRequestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpsSuccessBlock)success {
    [self POSTRequestWithPath:path params:params success:success failure:nil];
}
+ (void)POSTRequestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self POSTRequestWithPath:path params:params progress:nil success:success failure:failure];
}
+ (void)POSTRequestWithPath:(NSString *)path params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:nil params:params httpsLoadHUDType:HttpsLoadHUDTypeShow httpsRequestType:HttpsRequestPost httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}
+ (void)GETRequestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpsSuccessBlock)success {
    [self GETRequestWithPath:path params:params success:success failure:nil];
}
+ (void)GETRequestWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self GETRequestWithPath:path params:params progress:nil success:success failure:failure];
}
+ (void)GETRequestWithPath:(NSString *)path params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:nil params:params httpsLoadHUDType:HttpsLoadHUDTypeShow httpsRequestType:HttpsRequestGet httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}

#pragma mark Cookie
+ (void)POSTRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params success:(HttpsSuccessBlock)success {
    [self POSTRequestWithPath:path cookie:cookie params:params success:success failure:nil];
}
+ (void)POSTRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self POSTRequestWithPath:path cookie:cookie params:params progress:nil success:success failure:failure];
}
+ (void)POSTRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeShow httpsRequestType:HttpsRequestPost httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}
+ (void)GETRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params success:(HttpsSuccessBlock)success {
    [self GETRequestWithPath:path cookie:cookie params:params success:success failure:nil];
}
+(void)GETRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self GETRequestWithPath:path cookie:cookie params:params progress:nil success:success failure:failure];
}
+ (void)GETRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeShow httpsRequestType:HttpsRequestGet httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}

#pragma mark XML
+ (void)GETRequestXMLWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpsSuccessBlock)success  {
    [self GETRequestXMLWithPath:path params:params progress:nil success:success failure:nil];
}
+ (void)GETRequestXMLWithPath:(NSString *)path params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self GETRequestXMLWithPath:path cookie:nil params:params progress:progress success:success failure:failure];
}
+ (void)GETRequestXMLWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params success:(HttpsSuccessBlock)success {
    [self GETRequestXMLWithPath:path cookie:cookie params:params progress:nil success:success failure:nil];
}
+ (void)GETRequestXMLWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeShow httpsRequestType:HttpsRequestGet httpsRequestDataType:HttpsRequestDataTypeXML progress:progress success:success failure:failure];
}

#pragma mark HUD
+ (void)POSTRequestHidenHUDWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeHidden httpsRequestType:HttpsRequestPost httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}
+ (void)GETRequestHidenHUDWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeHidden httpsRequestType:HttpsRequestGet httpsRequestDataType:HttpsRequestDataTypeJSON progress:progress success:success failure:failure];
}
+ (void)GETRequestXMLHidenHUDWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self startRequestWithPath:path cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeHidden httpsRequestType:HttpsRequestGet httpsRequestDataType:HttpsRequestDataTypeXML progress:progress success:success failure:failure];
}

#pragma mark DataRequest
+ (void)startRequestWithPath:(NSString *)path cookie:(NSDictionary *)cookie params:(NSDictionary *)params httpsLoadHUDType:(HttpsLoadHUDType)loadType httpsRequestType:(HttpsRequest)requestType httpsRequestDataType:(HttpsRequestDataType)dataType progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    // URL
    path = [URLTool dataURLStringWithPathString:path];
    if (!path) return ;
    if (loadType == HttpsLoadHUDTypeShow) {
        [SVProgressHUD show];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    manager.securityPolicy.validatesDomainName = NO;
    if (dataType == HttpsRequestDataTypeJSON)
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
     else if (dataType == HttpsRequestDataTypeXML)
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // Cookie
    if (cookie) {
//        DLog(@"cookie: %@", cookie)
        manager.requestSerializer.HTTPShouldHandleCookies = YES;
        [manager.requestSerializer setValue:cookie[CookieVaule] forHTTPHeaderField:@"Cookie"];
    }
    // 类型
    if (requestType == HttpsRequestPost)
        // POST
        [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            // 进度
            if (progress != nil) 
                progress(uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 成功
            [self success:success JSONData:responseObject];
            if (loadType == HttpsLoadHUDTypeShow) 
                [SVProgressHUD dismiss];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 失败
            [self failure:failure error:error];
            if (loadType == HttpsLoadHUDTypeShow) 
                [SVProgressHUD dismiss];
        }];
     else
        // GET
        [manager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            // 进度
            if (progress) 
                progress(downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 成功
            if (dataType == HttpsRequestDataTypeXML) 
                responseObject = [NSDictionary dictionaryWithXMLData:responseObject];
            [self success:success JSONData:responseObject];
            if (loadType == HttpsLoadHUDTypeShow) 
                [SVProgressHUD dismiss];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 失败
            [self failure:failure error:error];
            if (loadType == HttpsLoadHUDTypeShow) 
                [SVProgressHUD dismiss];
        }];
}

#pragma mark DataRequest -- 外部判断ret
+ (void)POST:(NSString *)url params:(NSDictionary *)params cookie:(NSDictionary *)cookie success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure
{
    // AFN发送POST请求返回JSON数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    mgr.requestSerializer.timeoutInterval = timeoutInterval;
//    mgr.securityPolicy.allowInvalidCertificates = YES;
//    mgr.securityPolicy.validatesDomainName = NO;
    // Cookie
    if (cookie) {
        //        DLog(@"cookie: %@", cookie)
        mgr.requestSerializer.HTTPShouldHandleCookies = YES;
        [mgr.requestSerializer setValue:cookie[CookieVaule] forHTTPHeaderField:@"Cookie"];
    }
    // URL
    url = [URLTool dataURLStringWithPathString:url];
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = responseObject;
        if (success) 
            success([dict deleteNull]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) 
            failure(error);
    }];
    
}

#pragma mark - FileDownload
+ (void)downloadFileWithPath:(NSString *)path filePath:(NSString *)filePath completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path filePath:filePath progress:nil completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path filePath:(NSString *)filePath progress:(HttpsDownloadFileProgressBlock)progress completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:nil filePath:filePath httpsLoadHUDType:HttpsLoadHUDTypeShow progress:progress destination:nil completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path progress:nil destination:destination completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path progress:(HttpsDownloadFileProgressBlock)progress destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:nil filePath:nil httpsLoadHUDType:HttpsLoadHUDTypeShow progress:progress destination:destination completionHandler:completionHandler];
}

#pragma mark Cookie
+ (void)downloadFileWithPath:(NSString *)path cookie:(NSDictionary *)cookie filePath:(NSString *)filePath completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:cookie filePath:filePath progress:nil completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path cookie:(NSDictionary *)cookie filePath:(NSString *)filePath progress:(HttpsDownloadFileProgressBlock)progress completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:cookie filePath:filePath httpsLoadHUDType:HttpsLoadHUDTypeShow progress:progress destination:nil completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path cookie:(NSDictionary *)cookie destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:cookie progress:nil destination:destination completionHandler:completionHandler];
}
+ (void)downloadFileWithPath:(NSString *)path cookie:(NSDictionary *)cookie progress:(HttpsDownloadFileProgressBlock)progress destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:cookie filePath:nil httpsLoadHUDType:HttpsLoadHUDTypeShow progress:progress destination:destination completionHandler:completionHandler];
}

#pragma mark HUD
+ (void)downloadFileHidenHUDWithPath:(NSString *)path cookie:(NSDictionary *)cookie progress:(HttpsDownloadFileProgressBlock)progress destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:cookie filePath:nil httpsLoadHUDType:HttpsLoadHUDTypeHidden progress:progress destination:destination completionHandler:completionHandler];
}
+ (void)downloadFileHidenHudWithPath:(NSString *)path progress:(HttpsDownloadFileProgressBlock)progress destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    [self downloadFileWithPath:path cookie:nil filePath:nil httpsLoadHUDType:HttpsLoadHUDTypeHidden progress:progress destination:destination completionHandler:completionHandler];
}

#pragma mark FileDownload
+ (void)downloadFileWithPath:(NSString *)path cookie:(NSDictionary *)cookie filePath:(NSString *)filePath httpsLoadHUDType:(HttpsLoadHUDType)loadType progress:(HttpsDownloadFileProgressBlock)progress destination:(HttpsDownloadFileDestinationBlock)destination completionHandler:(HttpsDownloadFileCompletedBlock)completionHandler {
    // URLRequest
    NSURLRequest *request = [URLTool fileDownloadURLRequestWithPathString:path];
    if (!request) return ;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    manager.securityPolicy.validatesDomainName = NO;
    // cookie
    if (cookie) {
        manager.requestSerializer.HTTPShouldHandleCookies = YES;
        [manager.requestSerializer setValue:cookie[CookieVaule] forHTTPHeaderField:@"Cookie"];
    }
    filePath = [filePath stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        // 进度
        if (loadType == HttpsLoadHUDTypeShow) {
            [SVProgressHUD showProgress:downloadProgress.fractionCompleted status:SVStatus];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        }
        if (progress) 
            progress(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 下载
        if (filePath && ![filePath isEqualToString:@""]) 
            return [NSURL URLWithString:filePath];
        else if (destination) 
            return destination(targetPath, response);
        NSString *fileString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        return [NSURL URLWithString:fileString];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        // 完成
        if (error) 
            [self failure:nil error:error];
        if (completionHandler) 
            completionHandler(response, filePath);
        if (loadType == HttpsLoadHUDTypeShow) 
            [SVProgressHUD dismiss];
    }];
    [task resume];
}

#pragma mark - FileSend
+ (void)uploadFileWithURLString:(NSString *)urlString params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock success:(HttpsSuccessBlock)success {
    [self uploadFileWithURLString:urlString params:params constructingBodyBlock:constructingBodyBlock progress:nil success:success];
}
+ (void)uploadFileWithURLString:(NSString *)urlString params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success {
    [self uploadFileWithURLString:urlString params:params constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:nil];
}
+ (void)uploadFileWithURLString:(NSString *)urlString params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self uploadFileWithURLString:urlString params:params constructingBodyBlock:constructingBodyBlock progress:nil success:success failure:failure];
}
+ (void)uploadFileWithURLString:(NSString *)urlString params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self sendFileWithURLString:urlString cookie:nil params:params httpsLoadHUDType:HttpsLoadHUDTypeShow constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:failure];
}

#pragma mark Cookie
+ (void)uploadFileWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock success:(HttpsSuccessBlock)success {
    [self uploadFileWithURLString:urlString cookie:cookie params:params constructingBodyBlock:constructingBodyBlock success:success failure:nil];
}
+ (void)uploadFileWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success {
    [self uploadFileWithURLString:urlString cookie:cookie params:params constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:nil];
}
+ (void)uploadFileWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self uploadFileWithURLString:urlString cookie:cookie params:params constructingBodyBlock:constructingBodyBlock progress:nil success:success failure:failure];
}
+ (void)uploadFileWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self sendFileWithURLString:urlString cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeShow constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:failure];
}

#pragma mark HUD
+ (void)uploadFileHidenHUDWithURLString:(NSString *)urlString params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self sendFileWithURLString:urlString cookie:nil params:params httpsLoadHUDType:HttpsLoadHUDTypeHidden constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:failure];
}
+ (void)uploadFileHidenHUDWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    [self sendFileWithURLString:urlString cookie:cookie params:params httpsLoadHUDType:HttpsLoadHUDTypeHidden constructingBodyBlock:constructingBodyBlock progress:progress success:success failure:failure];
}

#pragma mark - FileSend
+ (void)sendFileWithURLString:(NSString *)urlString cookie:(NSDictionary *)cookie params:(NSDictionary *)params httpsLoadHUDType:(HttpsLoadHUDType)loadType constructingBodyBlock:(HttpsConstructingBodyBlock)constructingBodyBlock progress:(HttpsProgressBlock)progress success:(HttpsSuccessBlock)success failure:(HttpsFailureBlock)failure {
    // URL
    urlString = [URLTool fileSendURLStringWithPathString:urlString];
    if (!urlString) return ;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    manager.securityPolicy.validatesDomainName = NO;
    // cookie
    if (cookie) {
        manager.requestSerializer.HTTPShouldHandleCookies = YES;
        [manager.requestSerializer setValue:cookie[CookieVaule] forHTTPHeaderField:@"Cookie"];
    }
    [manager POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (constructingBodyBlock) 
            constructingBodyBlock(formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 进度
        if (loadType == HttpsLoadHUDTypeShow) {
            [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:SVStatus];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        }
        if (progress) 
            progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 完成
        if (success) 
            [self success:success JSONData:responseObject];
        if (loadType == HttpsLoadHUDTypeShow) 
            [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        if (error) 
            [self failure:failure error:error];
        if (loadType == HttpsLoadHUDTypeShow) 
            [SVProgressHUD dismiss];
    }];
}

// 未启用
+ (void)detectionNetworkState {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                // ...
                break;
            case AFNetworkReachabilityStatusNotReachable:
                // ...
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                // ...
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // ...
                break;
            default:
                break;
        }
    }];
}

#pragma mark - Success
+ (void)success:(HttpsSuccessBlock)success JSONData:(NSDictionary *)JSONData {
    JSONData = [JSONData deleteNull];
    NSInteger result = [JSONData[@"ret"] integerValue];
    NSString *msg = JSONData[@"msg"];
//    DLog(@"msg: %@", msg);
    if (result > 1) {
        if ([JSONData[@"msg"] length] > 0)
            [self setAlertViewWithMessage:msg];
    } else if (result == 1) {
        if (success) 
            success(JSONData);
    } else if (result == -1) {
        // 登录
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"ZYYLogin" object:nil userInfo:nil]];
    } else {
        DLog(@"请求出错 -> errmsg: %@", msg);
        [ZYToast showBottomText:msg];
    }
}

#pragma mark - Failure
+ (void)failure:(HttpsFailureBlock)failure error:(NSError *)error {
    NSString *errorMessage = [error localizedDescription];
    DLog(@"请求失败 -> error: %@", errorMessage)
    if (failure) 
        failure(error);
}

#pragma mark - alert View 
+ (void)setAlertViewWithMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示:" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

@end

@implementation UIImageView (Download)

- (void)downloadImageWithURLString:(NSString *)urlString {
    [self downloadImageWithURLString:urlString placeholderString:nil];
}

- (void)downloadImageWithURLString:(NSString *)urlString placeholderString:(NSString *)placeholder {
    [self downloadImageWithURLString:urlString placeholderString:placeholder completed:nil];
}

- (void)downloadImageWithURLString:(NSString *)urlString placeholderString:(NSString *)placeholder completed:(HttpsDownloadImageCompleted)completed {
    [self downloadImageWithURLString:urlString placeholderString:placeholder progress:nil completed:completed];
}

- (void)downloadImageWithURLString:(NSString *)urlString placeholderString:(NSString *)placeholder progress:(HttpsDownloadImageProgress)progress completed:(HttpsDownloadImageCompleted)completed {
    NSURL *url = [URLTool imageURLStringWithPathString:urlString];
    UIImage *placeholderImage;
    if ([placeholder isKindOfClass:[UIImage class]]) {
        placeholderImage = (UIImage *)placeholder;
    } else {
        if (placeholder.length)
            placeholderImage = [UIImage imageNamed:placeholder];
    }
    /**
     * options:
     *  @param SDWebImageRetryFailed    : 失败后重试
     *  @param SDWebImageLowPriority    : 延迟下载
     *  @param SDWebImageRefreshCached  : 刷新缓存
     *  @param SDWebImageContinueInBackground : 后台下载
     *  @param SDWebImageAllowInvalidSSLCertificates : 无效的SSL
     */
    if (url) {
        SDWebImageOptions options = SDWebImageRetryFailed | SDWebImageLowPriority | SDWebImageRefreshCached | SDWebImageContinueInBackground | SDWebImageAllowInvalidSSLCertificates;
        [self sd_setImageWithURL:url placeholderImage:placeholderImage options:options progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            if (progress) 
                progress(receivedSize, expectedSize);
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error)
                DLog(@"请求失败 -> error: %@", [error localizedDescription]);
            if (completed) 
                completed(image, imageURL);
        }];
    } else {
        self.image = placeholderImage;
    }
}

#pragma mark - alert View 
- (void)setAlertViewWithMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示:" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

@end

@implementation NSDictionary (Zy)

- (NSDictionary *)deleteNull {
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys)
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            NSString *key = [keyStr stringByReplacingOccurrencesOfString:@"_" withString:@""];
            [mutableDic setObject:@"" forKey:key];
        } else {
            NSString *key = [keyStr stringByReplacingOccurrencesOfString:@"_" withString:@""];
            [mutableDic setObject:[self objectForKey:keyStr] forKey:key];
        }
    return mutableDic;
}

@end
