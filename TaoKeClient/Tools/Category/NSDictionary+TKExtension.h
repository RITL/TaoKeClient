//
//  NSDictionary+TKExtension.h
//  TaoKeClient
//
//  Created by YueWen on 2017/11/2.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TKExtension)

@end


@interface NSDictionary (TKTransToJson)

/// 获得的不带换位符json字符串
@property (nonatomic, copy, nullable, readonly) NSString *tk_json;

/// 传递javascript的json字符串
@property (nonatomic, copy, nullable, readonly) NSString *tk_javascript_json;

@end

NS_ASSUME_NONNULL_END
