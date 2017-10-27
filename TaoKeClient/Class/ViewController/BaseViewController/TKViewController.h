//
//  TKViewController.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKNavigationBarController.h"

NS_ASSUME_NONNULL_BEGIN

/// 淘客的基础控制器
@interface TKViewController : UIViewController


/**
 在init方法中加载自己的属性
 */
- (void)loadPropertysAtInitialization NS_REQUIRES_SUPER;


#pragma mark - childViewControllers
- (void)actionBackItemInNavigationBar;


#pragma mark - TEST

/**
 默认不做任何操作，用于测试
 */
- (void)doNothing;


@end


@interface TKViewController (TKNavigationBarController) <TKNavigationBarController>


/**
 设置导航栏的属性
 */
- (void)tk_setCustomNavigationBarProperty;

@end

NS_ASSUME_NONNULL_END
