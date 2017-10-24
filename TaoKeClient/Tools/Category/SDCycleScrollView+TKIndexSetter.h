//
//  SDCycleScrollView+TKIndexSetter.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/5/9.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <SDCycleScrollView/SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCycleScrollView (TKIndexSetter)


/**
 轮播图滚动到当前的位置
 
 默认animated属性为false
 
 @param currentIndex 滚动达到的位置
 @return true表示成功，false反之
 */
- (BOOL)scrollToIndex:(NSInteger)currentIndex;


/**
 轮播图滚动到当前的位置

 @param currentIndex 滚动达到的位置
 @param animated 是否使用动画滚动
 @return true表示成功，false反之
 */
- (BOOL)scrollToIndex:(NSInteger)currentIndex animated:(BOOL)animated;

@end


@interface SDCycleScrollView (TKExtension)

@end


NS_ASSUME_NONNULL_END
