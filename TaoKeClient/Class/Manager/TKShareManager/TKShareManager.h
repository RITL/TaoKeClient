//
//  TKShareManager.h
//  TaoKeClient
//
//  Created by YueWen on 2017/11/1.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 掌控分享的Manager
@interface TKShareManager : NSObject

/// 单例控制器
+ (instancetype)sharedInstance;

/// 分享web信息
+ (void)sharedWebMessage:(NSDictionary *)info atViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
