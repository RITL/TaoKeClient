//
//  TKGeneralItem.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKGood.h"

NS_ASSUME_NONNULL_BEGIN

/// 
@interface TKGeneralItem : UIView

/// 预览图
@property (nonatomic, strong) UIImageView *imageView;
/// 商品名称
@property (nonatomic, strong) UILabel *titleLabel;
/// 价格标签
@property (nonatomic, strong) UILabel * priceLabel;
/// 优惠券标签
@property (nonatomic, strong) UILabel * discountLabel;
/// 使用优惠券后的金额标签
@property (nonatomic, strong) UILabel * discountNumberLabel;
/// 立即领券按钮
@property (nonatomic, strong) UIButton * getDiscountButton;



/// 更新信息
- (void)updateMessInfo:(id <TKGood>)good;


@end

NS_ASSUME_NONNULL_END
