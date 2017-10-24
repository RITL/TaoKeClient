//
//  TKExtension
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/15.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TKImageAttributeString)

/// 设置带图片的属性字符串
- (NSAttributedString *)tk_imageAttributeStringWithImage:(UIImage *)image
                                               attributes:(NSDictionary * _Nullable)attributes
                                         baselineOffValue:(NSNumber *)value;


@end



@interface NSString (TKMD5)

/// 32位小写的md5
@property (nonatomic, copy, readonly)NSString *tk_md5ForLower32Bate;

@end


@interface NSString (TKURL)

/// url
@property (nonatomic, strong, readonly, nullable) NSURL *tk_url;

@end


@interface NSString (TKPhone)

/// 进行*加密的手机号,不会进行手机号判定
@property (nonatomic, copy, readonly) NSString *tk_phone;

@end


@interface NSString (TKAttributeString)

/// 带下划线的字符串
@property (nonatomic, copy, readonly)NSAttributedString *tk_underLineString;

@end


@interface NSString (TKDate)

/// 格式 yyyy-MM-dd 格式的日期 - (本身为时间戳)
@property (nonatomic, copy, readonly, nullable) NSString *tk_dayDate;

@end


@interface NSString (TKRandom)

/// 32位随机字符串
@property (nonatomic, copy, readonly, nullable, class) NSString *tk_randowString;

@end

NS_ASSUME_NONNULL_END
