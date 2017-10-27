//
//  JPNavigationController+TKViewControllerPreferredStatusBarStyle.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/4.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "JPNavigationController+TKViewControllerPreferredStatusBarStyle.h"
#import <JPWarpViewController.h>
#import <JPWarpNavigationController.h>

@implementation JPNavigationController (TKPreferredStatusBarStyle)


-(UIStatusBarStyle)preferredStatusBarStyle
{
//    //获得warpViewController
//    JPWarpViewController *viewController = self.childViewControllers.lastObject;
//
//    //获得warpNavigationController
//    JPWarpNavigationController *navigationControlller= viewController.childViewControllers.lastObject;
//
//    //获得自己的控制器
//    UIViewController *ownViewController = navigationControlller.viewControllers.lastObject;
//
    return self.tk_visableViewController.preferredStatusBarStyle;
}


@end

//@implementation UINavigationController (TKPreferredStatusBarStyle)
//
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    UIViewController *viewController = self.visibleViewController;
//    
//    return viewController.preferredStatusBarStyle;
//}
//
//@end


@implementation JPNavigationController (TKVisableViewController)


- (UIViewController *)tk_visableViewController
{
    //获得warpViewController
    JPWarpViewController *viewController = self.childViewControllers.lastObject;
    
    //获得warpNavigationController
    JPWarpNavigationController *navigationControlller= viewController.childViewControllers.lastObject;
    
    //获得自己的控制器
    UIViewController *ownViewController = navigationControlller.viewControllers.lastObject;
    
    return ownViewController;
}


- (UIViewController *)tk_rootViewController
{
    //获得warpViewController
    JPWarpViewController *viewController = self.childViewControllers.firstObject;
    
    //获得warpNavigationController
    JPWarpNavigationController *navigationControlller= viewController.childViewControllers.lastObject;
    
    //获得自己的控制器
    UIViewController *ownViewController = navigationControlller.viewControllers.lastObject;
    
    return ownViewController;
}

@end
