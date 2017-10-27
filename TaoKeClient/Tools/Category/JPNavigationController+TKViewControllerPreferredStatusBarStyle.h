//
//  JPNavigationController+TKViewControllerPreferredStatusBarStyle.h
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/4.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import <JPNavigationControllerKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPNavigationController (TKPreferredStatusBarStyle)

@end


@interface UINavigationController (TKPreferredStatusBarStyle)

@end


@interface JPNavigationController (TKVisableViewController)


@property (nonatomic, weak, nullable, readonly)UIViewController *tk_visableViewController;

@property (nonatomic, weak, nullable, readonly)UIViewController *tk_rootViewController;

@end

NS_ASSUME_NONNULL_END
