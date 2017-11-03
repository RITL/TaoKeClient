//
//  TKGood.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKEnity.h"

NS_ASSUME_NONNULL_BEGIN

/// 主页推荐object
@protocol TKGood <NSObject,TKEnity>

/// 商品id
@property (nonatomic, copy, nullable) NSString *identifer;
/// 商品名称
@property (nonatomic, copy, nullable) NSString *product_name;
/// 商品的主要图片url
@property (nonatomic, copy, nullable) NSString *product_main_image;
/// 商品分类
@property (nonatomic, copy, nullable) NSString *procuct_category;
/// 商品的url
@property (nonatomic, copy, nullable) NSString *product_url;
/// 原价
@property (nonatomic, copy, nullable) NSString *product_pure_provice;
/// 折扣
@property (nonatomic, copy, nullable) NSString *coupon_denomination;
/// 折扣限制
@property (nonatomic, copy, nullable) NSString *coupon_limit;
/// 折后价
@property (nonatomic, copy, nullable) NSString *pure_provice;
/// 结束时间的时间戳
@property (nonatomic, copy, nullable) NSString *coupon_end;
/// 添加时间的时间戳
@property (nonatomic, copy, nullable) NSString *add_time;
/// 领卷的url
@property (nonatomic, copy, nullable) NSString *coupon_url;

@property (nonatomic, copy, nullable) NSString *is_index_tui;
@property (nonatomic, copy, nullable) NSString *status;
/// 类型
@property (nonatomic, copy, nullable) NSString *type;
@property (nonatomic, copy, nullable) NSString *is_import;
@property (nonatomic, copy, nullable) NSString *qrcodeurl;
@property (nonatomic, copy, nullable) NSString *taotoken;
@property (nonatomic, copy, nullable) NSString *importtype;
/// 商品的goodid
@property (nonatomic, copy, nullable) NSString *goodid;
@property (nonatomic, copy, nullable) NSString *cid;
@property (nonatomic, copy, nullable) NSString *sellerid;
@property (nonatomic, copy, nullable) NSString *jihualink;
/// 介绍
@property (nonatomic, copy, nullable) NSString *introduce;
@property (nonatomic, copy, nullable) NSString *importtype2;

@end

NS_ASSUME_NONNULL_END
