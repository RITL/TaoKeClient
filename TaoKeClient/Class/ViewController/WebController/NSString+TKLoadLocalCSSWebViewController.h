//
//  NSString+TKLoadLocalCSSWebViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/31.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKGood.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TKLoadLocalCSSWebViewController)


/// 根据good对象初始化响应的html字符串
+ (nullable NSString *)tk_localHTML:(nullable id <TKGood>)good;

@end

NS_ASSUME_NONNULL_END
