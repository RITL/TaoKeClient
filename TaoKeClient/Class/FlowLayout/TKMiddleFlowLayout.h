//
//  XNDFarmRecommendFlowLayout.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/18.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TKMiddleFlowLayout;

@protocol TKMiddleDelegateFlowLayout <NSObject,UICollectionViewDelegate>

- (void)farmRecommendMiddleFlowLayout:(TKMiddleFlowLayout *)flowLayout
                        scrollToIndex:(NSInteger)index
                                total:(NSInteger)count;

@end

/// 中间的布局
@interface TKMiddleFlowLayout : UICollectionViewLayout

/// 最小的item大小
@property (nonatomic, assign) CGSize minItemSize;
/// 最大的item大小
@property (nonatomic, assign) CGSize maxItemSize;
/// 每个cell之间的间距
@property (nonatomic, assign) CGFloat itemMargin;
/// 两边边缘cell露出的距离
@property (nonatomic, assign) CGFloat itemMarginSpace;
/// 协议对象
@property (nonatomic, weak, nullable)id <TKMiddleDelegateFlowLayout> delegate;

@end

NS_ASSUME_NONNULL_END
