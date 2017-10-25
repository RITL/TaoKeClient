//
//  CAGradientLayer+TKGradientLayer.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/6/23.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

#define TKCAGradientLayerBeginColor ([UIColor.blackColor colorWithAlphaComponent:0])
#define TKCAGradientLayerEndColor   ([UIColor.blackColor colorWithAlphaComponent:0.8])

/// 淘客 渐变色
@interface CAGradientLayer (TKGradientLayer)

/// 淘客 渐变色
+ (instancetype)tk_GradientLayer:(CGRect)bounds;

///通用渐变色设置
+(instancetype)tk_GradientLayer:(CGRect)bounds FirstColor:(UIColor *)firstColor SecondColor:(UIColor *)secondColor;


@end


@interface UINavigationController (TKNavigationBarCAGradientLayer)

/// 当前navigationBar上的所有渐变layer
@property (nonatomic, copy, readonly, nullable)NSArray < CAGradientLayer *> *tk_gradinentLayers;

/// 默认的第一个
@property (nonatomic, strong, readonly, nullable)CAGradientLayer *tk_firstGradientLayer;

@end

NS_ASSUME_NONNULL_END
