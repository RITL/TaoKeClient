//
//  TKAllCategoryHeaderView.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKGood.h"
#import "TKCategoryTitle.h"

NS_ASSUME_NONNULL_BEGIN

@class TKCardCycleScrollView;
@class LLSegmentBar;

@interface TKAllCategoryHeaderView : UIView

/// 轮播
@property (nonatomic, strong) TKCardCycleScrollView * cycleView;

/// 推荐
@property (nonatomic, strong) LLSegmentBar *segmentBar;

/// 更新banner
- (void)updateCycleItems:(NSArray<id<TKGood>>*)items;

/// 更新推荐
- (void)updateSegmentItems:(NSArray<id<TKCategoryTitle>>*)titles;

@end

NS_ASSUME_NONNULL_END
