//
//  UIView+TKFrameChanged.h
//  TKPhotoDemo
//
//  Created by YueWen on 2017/3/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 边界的方法
@interface UIView (TKFrameChanged)

@property (nonatomic, assign)CGPoint tk_originPoint;
@property (nonatomic, assign)CGSize  tk_size;

@property (nonatomic, assign)CGFloat tk_originX;
@property (nonatomic, assign)CGFloat tk_originY;

@property (nonatomic, assign)CGFloat tk_width;
@property (nonatomic, assign)CGFloat tk_height;

@property (nonatomic, assign)CGFloat tk_centerX;
@property (nonatomic, assign)CGFloat tk_centerY;

@property (nonatomic, assign, readonly)CGFloat tk_maxX;
@property (nonatomic, assign, readonly)CGFloat tk_maxY;

@property (nonatomic, assign, readonly)CGFloat tk_minX;
@property (nonatomic, assign, readonly)CGFloat tk_minY;

@property (nonatomic, assign, readonly)CGFloat tk_midX;
@property (nonatomic, assign, readonly)CGFloat tk_midY;

@end


@interface UIViewController (TKFrameChanged)

@property (nonatomic, assign, readonly)CGFloat tk_width;
@property (nonatomic, assign, readonly)CGFloat tk_height;

@end


@interface UIScreen (TKFrameChanged)

@property (nonatomic, assign, readonly)CGFloat tk_width;
@property (nonatomic, assign, readonly)CGFloat tk_height;

/// 相对375.0的宽度放大的比例
@property (nonatomic, assign, readonly)CGFloat tk_width_scale;

@end


@interface UIScrollView (TKFrameChanged)

@property (nonatomic, assign)CGFloat tk_contentOffSetX;
@property (nonatomic, assign)CGFloat tk_contentOffSetY;

@property (nonatomic, assign)CGFloat tk_contentSizeWidth;
@property (nonatomic, assign)CGFloat tk_contentSizeHeight;


- (void)setTk_contentOffSetX:(CGFloat)tk_contentOffSetX animated:(BOOL)animated;
- (void)setTk_contentOffSetY:(CGFloat)tk_contentOffSetY animated:(BOOL)animated;

@end


@interface UIView (TKSimpleInit)

/// 便利初始化方法
+ (instancetype)tk_viewInstanceTypeHandler:(void(^)(__kindof UIView * view))viewHandler;
+ (instancetype)tk_viewInstanceFrame:(CGRect)frame initizationHandler:(void(^)(__kindof UIView * view))viewHandler;

/// 修改frame返回自己
- (instancetype)viewChangedFrame:(CGRect)frame;

@end




NS_ASSUME_NONNULL_END
