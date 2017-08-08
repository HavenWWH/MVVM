//
//  HTTPTool.h
//
//  Created by Zy on 16/6/26.
//  Copyright © 2016年 Zy. All rights reserved.
//  
//  HTTPS网络请求


/**
 * HTTPS请求
 *  需要使用CocosPod导入以下第三方库:
 *   AFNetworking   ~> 3.1.0
 *   SDWebImage     ~> 4.0.0
 *   SVProgressHUD  2.0.3
 *   XMLDictionary  ~> 1.4.1
 */

/**
 * 注意:
 *  AFNetworking:
 *   需要对 AFURLResponseSerialization.m(228) 添加类型支持 "text/html"
 *  SVProgressHUD:
 *   需要指定 2.0.3 版本，否则SVProgressHUDMaskTypeGradient会出问题.
 */


#import <AFNetworking.h>
#import "URLTool.h"

typedef void(^HttpsProgressBlock)(NSProgress * _Nonnull progress);
typedef void (^HttpsSuccessBlock)(NSDictionary * _Nonnull JSON);
typedef void (^HttpsFailureBlock)(NSError * _Nonnull error);

typedef void(^HttpsDownloadFileProgressBlock)(NSProgress * _Nonnull progress);
typedef NSURL * _Nonnull(^HttpsDownloadFileDestinationBlock)(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response);
typedef void(^HttpsDownloadFileCompletedBlock)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath);

typedef void(^HttpsConstructingBodyBlock)(id<AFMultipartFormData> _Nonnull formData);

typedef void(^HttpsDownloadImageProgress)(NSInteger receivedSize, NSInteger expectedSize);
typedef void(^HttpsDownloadImageCompleted)(UIImage * _Nonnull image, NSURL * _Nonnull imageURL);

//static NSString * _Nonnull const CookieName = @"cookieName";
static NSString * _Nonnull const CookieVaule = @"cookieVaule";

/**
 * HTTPSTool
 *  网络HTTP/HTTPS请求工具.
 */
@interface HTTPSTool : NSObject

#pragma mark DataRequest -- 外部判断ret
/**
 * POST请求
 *  外部判断ret.
 *  @param url URL地址路径
 *  @param params 参数
 *  @param cookie Cookie
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)POST:(NSString * _Nonnull)url params:(NSDictionary * _Nullable)params cookie:(NSDictionary * _Nullable)cookie success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;

#pragma mark - DataRequest
/**
 * POST请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param success 成功回调
 */
+ (void)POSTRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * POST请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)POSTRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * POST请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)POSTRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable) params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param success 成功回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * GET请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;

#pragma mark Cookie
/**
 * POST请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param success 成功回调
 */
+(void)POSTRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * POST请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+(void)POSTRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * POST请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+(void)POSTRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param success 成功回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * GET请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;

#pragma mark XML
/**
 * GET请求(XML)
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param success 成功回调
 */
+ (void)GETRequestXMLWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * GET请求(XML)
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestXMLWithPath:(NSString * _Nonnull)path params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求(XML)
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param success 成功回调
 */
+ (void)GETRequestXMLWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params success:(HttpsSuccessBlock _Nullable)success;
/**
 * GET请求(XML)
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestXMLWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;

#pragma mark HUD
/**
 * POST请求
 *  不带HUD请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)POSTRequestHidenHUDWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求
 *  不带HUD请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestHidenHUDWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 * GET请求(XML)
 *  不带HUD请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GETRequestXMLHidenHUDWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nullable)success failure:(HttpsFailureBlock _Nullable)failure;

#pragma mark - FileDownload
/**
 * 文件下载
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param filePath 文件保存路径
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path filePath:(NSString * _Nonnull)filePath completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 * 文件下载
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param filePath 文件保存路径
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path filePath:(NSString * _Nonnull)filePath progress:(HttpsDownloadFileProgressBlock _Nullable)progress completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 * 文件下载
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param destination 文件下载回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 * 文件下载
 *  不带Cookie请求.
 *  @param path URL地址路径
 *  @param progress 进度回调
 *  @param destination 文件保存路径
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path progress:(HttpsDownloadFileProgressBlock _Nullable)progress destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
#pragma mark Cookie
/**
 * 文件下载
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param filePath 文件保存路径
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie filePath:(NSString * _Nonnull)filePath completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 * 文件下载
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param filePath 文件保存路径
 *  @param progress 进度回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie filePath:(NSString * _Nonnull)filePath progress:(HttpsDownloadFileProgressBlock __nullable)progress completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 * 文件下载
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param destination 文件下载回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 *  文件下载
 *  带Cookie请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param progress 进度回调
 *  @param destination 文件下载回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nonnull)cookie progress:(HttpsDownloadFileProgressBlock _Nullable)progress destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;

#pragma mark HUD
/**
 *  文件下载
 *  不带HUD请求.
 *  @param path URL地址路径
 *  @param cookie Cookie
 *  @param progress 进度回调
 *  @param destination 文件下载回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileHidenHUDWithPath:(NSString * _Nonnull)path cookie:(NSDictionary * _Nullable)cookie progress:(HttpsDownloadFileProgressBlock _Nullable)progress destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;
/**
 *  文件下载
 *  不带HUD、Cookie请求.
 *  @param path URL地址路径
 *  @param progress 进度回调
 *  @param destination 文件下载回调
 *  @param completionHandler 完成回调
 */
+ (void)downloadFileHidenHudWithPath:(NSString * _Nonnull)path progress:(HttpsDownloadFileProgressBlock _Nullable)progress destination:(HttpsDownloadFileDestinationBlock _Nonnull)destination completionHandler:(HttpsDownloadFileCompletedBlock _Nonnull)completionHandler;

#pragma mark - FileSend
/**
 *  文件上传
 *  不带Cookie请求.
 *  @param urlString URL地址路径
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param success 成功回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock success:(HttpsSuccessBlock _Nonnull)success;
/**
 *  文件上传
 *  不带Cookie请求.
 *  @param urlString URL地址路径
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param progress 进度回调
 *  @param success 成功回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success;
/**
 *  文件上传
 *  不带Cookie请求.
 *  @param urlString URL地址路径
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 *  文件上传
 *  不带Cookie请求.
 *  @param urlString URL地址路径
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
#pragma mark Cookie
/**
 *  文件上传
 *  带Cookie请求.
 *  @param urlString URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param success 成功回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock success:(HttpsSuccessBlock _Nonnull)success;
/**
 *  文件上传
 *  带Cookie请求.
 *  @param urlString URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param progress 进度回调
 *  @param success 成功回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success;
/**
 *  文件上传
 *  带Cookie请求.
 *  @param urlString URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 *  文件上传
 *  带Cookie请求.
 *  @param urlString URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)uploadFileWithURLString:(NSString * _Nonnull)urlString cookie:(NSDictionary * _Nonnull)cookie params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
#pragma mark HUD
/**
 *  文件上传
 *  不带HUD请求.
 *  @param urlString URL地址路径
 *  @param params 参数
 *  @param constructingBodyBlock 文件上传回调
 *  @param progress 进度回调
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)uploadFileHidenHUDWithURLString:(NSString * _Nonnull)urlString params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;
/**
 *  文件上传
 *  @param urlString URL地址路径
 *  @param cookie Cookie
 *  @param params 参数
 *  @param constructingBodyBlock 回调Block
 *  @param progress 进度
 *  @param success 成功
 *  @param failure 失败
 */
+ (void)uploadFileHidenHUDWithURLString:(NSString * _Nonnull)urlString cookie:(NSDictionary * _Nullable)cookie params:(NSDictionary * _Nullable)params constructingBodyBlock:(HttpsConstructingBodyBlock _Nonnull)constructingBodyBlock progress:(HttpsProgressBlock _Nullable)progress success:(HttpsSuccessBlock _Nonnull)success failure:(HttpsFailureBlock _Nullable)failure;

@end


@interface UIImageView (Download)

/**
 *  图像下载
 *  @param urlString URL地址路径
 */
- (void)downloadImageWithURLString:(NSString * _Nonnull)urlString;
/**
 *  图像下载
 *  @param urlString URL地址路径
 *  @param placeholder 占位图像名
 */
- (void)downloadImageWithURLString:(NSString * _Nonnull)urlString placeholderString:(NSString * _Nullable)placeholder;
/**
 *  图像下载
 *  @param urlString URL地址路径
 *  @param placeholder 占位图像名
 *  @param completed 完成回调
 */
- (void)downloadImageWithURLString:(NSString * _Nonnull)urlString placeholderString:(NSString * _Nullable)placeholder completed:(HttpsDownloadImageCompleted _Nullable)completed;
/**
 *  图像下载
 *  @param urlString URL地址路径
 *  @param placeholder 占位图像名
 *  @param progress 进度回调
 *  @param completed 完成回调
 */
- (void)downloadImageWithURLString:(NSString * _Nonnull)urlString placeholderString:(NSString * _Nullable)placeholder progress:(HttpsDownloadImageProgress _Nullable)progress completed:(HttpsDownloadImageCompleted _Nullable)completed;

@end
