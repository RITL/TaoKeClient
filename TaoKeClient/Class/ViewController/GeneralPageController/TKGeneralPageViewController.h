//
//  TKGeneralPageViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class LLSegmentBar;

/// LLSegmentBar 存在于NavigationBar上的pageController
@interface TKGeneralPageViewController : TKViewController

/// 导航栏顶部的segmentBar
@property (nonatomic, strong, readonly) LLSegmentBar *segmentBar;

/// 导航选择栏的titles
@property (nonatomic, copy)NSArray <NSString *> *segmentBarTitles;

/// 包含的viewControllers
@property (nonatomic, copy)NSArray <UIViewController *> *contentViewControllers;

@end

NS_ASSUME_NONNULL_END
