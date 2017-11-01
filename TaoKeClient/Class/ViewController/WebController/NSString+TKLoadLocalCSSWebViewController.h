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


/// 获得猜你喜欢格式的div字符串
+ (nullable NSString *)tk_localHTMLSimilarRecommend:(nullable id <TKGood>)good;

@end


@interface NSArray (TKLoadLocalCSSWebViewController)


/// 获得所有数据拼接完毕的html
- (nullable NSString *)tk_localHTML:(nullable id <TKGood>)good;

/// 猜你喜欢格式的拼接,<ObjectType> : <id <TKGood>>
- (nullable NSString *)tk_localHTMLSimilarRecommend;

@end

NS_ASSUME_NONNULL_END
