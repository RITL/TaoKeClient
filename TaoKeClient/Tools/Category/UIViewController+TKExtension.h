//
//  UIViewController+TKExtension.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/24.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// UIViewController的拓展
@interface UIViewController (TKInitializeHandler)



/// 初始化方法
+ (instancetype)viewController:(void(^)(__kindof UIViewController *viewController))initializeHandler;



@end



@interface UIViewController (TKLevel)

/// 除navigationController、tabBarViewController的顶层视图
@property (nonatomic, weak, nullable, readonly)UIViewController *tk_topLevelController;



/**
 使用tk_topLevelController的导航进行导航跳转的方法

 @param viewController 进行跳转的控制器
 @param animated 是否使用动画
 */
- (void)tk_topNavigationPushViewController:(__kindof UIViewController *)viewController
                                   animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
