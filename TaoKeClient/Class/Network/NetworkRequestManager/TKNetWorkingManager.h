//
//  TKNetWorkingManager.h
//  XiaoNongDingClient
//
//  Created by admin on 2017/4/25.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

typedef enum : NSUInteger {
    HTTP_GET,
    HTTP_POST,
    HTTP_PUT,
    HTTP_DELETE
} HTTPMethod;

typedef void (^NetWorkingSuccessBlock)(NSDictionary *data);
typedef void (^NetWorkingFailureBlock)(NSError *error);


@interface TKNetWorkingManager : NSObject

@property (nonatomic, strong) NetWorkingSuccessBlock networkingSuccessBlock;
@property (nonatomic, strong) NetWorkingFailureBlock networkingFailureBlock;

/**
 Initialization

 @return sharedManager
 */
+ (instancetype)sharedNetWorkingManager;

/**
 requestMethod

 @param urlString url
 @param httpMethod HTTPMethod
 @param parameters 使用字典传入参数
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */

+ (NSURLSessionDataTask *)requestWithUrlString:(NSString *)urlString Method:(HTTPMethod)httpMethod Parameters:(NSDictionary *)parameters success:(NetWorkingSuccessBlock)successBlock failure:(NetWorkingFailureBlock)failureBlock;

@end

/// 继承自AF框架，避免[AFHTTPSessionManager manager]引发内存泄露
@interface AFHTTPSessionManager (TKSharedInstance)

/// 单例对象
+ (instancetype)sharedInstance;

/// 设置超时时间的AFHTTPSessionManager

- (instancetype)timeOut:(NSTimeInterval)outTime;

@end
