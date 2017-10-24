//
//  NSObject+TKExtension.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/11.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TKExtension)


/// 便利初始化方法
+ (instancetype)tk_object:(void(^)(__kindof id object))initialHandler;


@end

NS_ASSUME_NONNULL_END
