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

@class LLSegmentBar;
@class TKCardCycleScrollView;
@class TKAllCategoryHeaderView;



/**
 响应的类型

 - TKAllCategoryHeaderViewActionTypeCycle: 轮播响应
 - TKAllCategoryHeaderViewActionTypeSegment: 分类seg响应
 - strong:
 */
typedef NS_ENUM(NSInteger,TKAllCategoryHeaderViewActionType){
    
    TKAllCategoryHeaderViewActionTypeCycle = 0,
    TKAllCategoryHeaderViewActionTypeSegment
    
};


@protocol TKAllCategoryHeaderDelegate <NSObject>

@optional

- (void)tk_allCategoryHeaderView:(TKAllCategoryHeaderView *)headerView
                            type:(TKAllCategoryHeaderViewActionType)type
                            info:(NSDictionary *)info;


@end


@interface TKAllCategoryHeaderView : UIView

/// 轮播
@property (nonatomic, strong) TKCardCycleScrollView * cycleView;

/// 推荐
@property (nonatomic, strong) LLSegmentBar *segmentBar;

/// 代理对象
@property (nonatomic, weak, nullable) id<TKAllCategoryHeaderDelegate> delegate;

/// 更新banner
- (void)updateCycleItems:(NSArray<id<TKGood>>*)items;

/// 更新推荐
- (void)updateSegmentItems:(NSArray<id<TKCategoryTitle>>*)titles;

@end

NS_ASSUME_NONNULL_END
