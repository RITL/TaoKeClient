//
//  TKNetWorkingManager.m
//  XiaoNongDingClient
//
//  Created by admin on 2017/4/25.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKNetWorkingManager.h"
//#import "UIDevice+TKiPhoneModel.h"

@implementation TKNetWorkingManager


+ (instancetype)sharedNetWorkingManager {
    
    static TKNetWorkingManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[TKNetWorkingManager alloc] init];
    });
    
    return manager;
}

+ (NSURLSessionDataTask *)requestWithUrlString:(NSString *)urlString Method:(HTTPMethod)httpMethod Parameters:(NSDictionary *)parameters success:(NetWorkingSuccessBlock)successBlock failure:(NetWorkingFailureBlock)failureBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedInstance];

    parameters = parameters ? parameters : @{};
    
    NSMutableDictionary *parametersInfo = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    //添加统一的token & key
    NSString *key = NSString.tk_randowString;
    NSString *date = NSDate.tk_timeIntervalSince1970.tk_dayDate;
    NSString *token = [NSString stringWithFormat:@"%@+adam+%@",date,key].tk_md5ForLower32Bate;
    //追加
    [parametersInfo addEntriesFromDictionary:@{@"key": key}];//app版本号
    [parametersInfo addEntriesFromDictionary:@{@"token":token}];//platform

    
    switch (httpMethod) {
        case HTTP_GET: {
            return [manager GET:urlString parameters:parameters.mutableCopy progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (successBlock) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                    successBlock(dict);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failureBlock) {
                    failureBlock(error);
                }
            }];
            break;
        }
        case HTTP_POST: {
            return [manager POST:urlString parameters:parameters.mutableCopy progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (successBlock) {
                    
                    NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
                    
                    NSError *error;
                    
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
                    
                    if (error) {
                        
                        NSLog(@"error = %@",error.localizedDescription);
                        failureBlock(error);
                    }
                    
                    else {
                    
                        successBlock(dict);
                    }
                    
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failureBlock) {
                    failureBlock(error);
                }
            }];
        }
        default:
            break;
    }
    
    return nil;
}

@end


@implementation AFHTTPSessionManager (TKSharedInstance)

+(instancetype)sharedInstance
{
    static AFHTTPSessionManager *manager = nil;
    
    if (manager) {
        
        manager.requestSerializer.timeoutInterval = 15.0;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        /**
         *  请求队列的最大并发数
         */
        //    manager.operationQueue.maxConcurrentOperationCount = 5;
        /**
         *  请求超时的时间
         */
        
        manager.requestSerializer.timeoutInterval = 15.0;
        
    });
    
    return manager;
}




-(instancetype)timeOut:(NSTimeInterval)outTime
{
    self.requestSerializer.timeoutInterval = outTime;
    
    return self;
}

@end
