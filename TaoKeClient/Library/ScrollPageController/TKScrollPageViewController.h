//
//  TKScrollPageViewController.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/9/4.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSegmentBar.h"

NS_ASSUME_NONNULL_BEGIN

/// UIPageViewControllerTransitionStyleScroll 模式下的UIPageViewController
@interface TKScrollPageViewController : UIPageViewController

/// 当前的控制器
@property (nonatomic, weak, nullable) UIViewController *currentViewController;

/// 当前控制器的索引
@property (nonatomic, assign, readonly) NSInteger currentIndex;

/// 涵盖的viewControllers
@property (nonatomic, copy)NSArray <__kindof UIViewController *> *contentViewControllers;


@end




@class TKScrollHorizontalPageViewController;

@protocol TKScrollHorizontalPageDelegate <NSObject>

@optional


/**
 TKScrollHorizontalPageViewController 将要变为第几个控制器

 @param viewController TKScrollHorizontalPageViewController
 @param index 当前控制器的index
 */
- (void)tk_scrollHorizontalPageViewController:(TKScrollHorizontalPageViewController *)viewController
                                  willToIndex:(NSInteger)index;


@end



@interface TKScrollHorizontalPageViewController : TKScrollPageViewController <LLSegmentBarDelegate>

/// 代理
@property (nonatomic, weak, nullable) id<TKScrollHorizontalPageDelegate> tk_delegate;

/// 控制器
@property (nonatomic, strong) LLSegmentBar * segmentBar;

/// 导航栏的pop手势
@property (nonatomic, weak)UIPanGestureRecognizer *popPanGestureRecognizer;

@end


@interface TKScrollVerticalPageViewController : TKScrollPageViewController

@end








@interface UIPageViewController (TKScrollView)

/// 滚动视图
@property (nonatomic, weak, nullable, readonly) UIScrollView *tk_scrollView;

/// 滚动视图的滑动手势
@property (nonatomic, strong, nullable, readonly) UIPanGestureRecognizer *tk_scrollPanGestureRecongnizer;

/// 滚动视图的所有手势
@property (nonatomic, copy, nullable, readonly) NSArray <UIGestureRecognizer *> *tk_gestureRecongnizers;

@end
















@interface TKScrollPageViewController (UIPageViewControllerDataSource) <UIPageViewControllerDataSource>



@end



@interface TKScrollPageViewController (UIPageViewControllerDelegate) <UIPageViewControllerDelegate>



@end


NS_ASSUME_NONNULL_END
