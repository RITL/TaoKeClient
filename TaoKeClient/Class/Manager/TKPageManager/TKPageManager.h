//
//  TKPageManager.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/8/8.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


extern NSString *TKPageManagerHandlerPlatformKey;


/// 进行界面跳转的manager
@interface TKPageManager : NSObject

/// 当前显示的控制器
@property (nonatomic, weak, nullable)UIViewController *currentViewController;

/// 单例对象
+ (instancetype)sharedInstance;

/// 进行逻辑界面跳转的方法
+ (void)pageManagerFromObject:(nullable id)object info:(NSDictionary *)info;

@end



NS_ASSUME_NONNULL_END
