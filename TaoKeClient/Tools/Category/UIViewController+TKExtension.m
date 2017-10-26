//
//  UIViewController+TKExtension.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/7/24.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "UIViewController+TKExtension.h"

@implementation UIViewController (TKInitializeHandler)


+(instancetype)viewController:(void (^)(__kindof UIViewController * _Nonnull))initializeHandler
{
    id viewController = [[self alloc]init];
    
    initializeHandler(viewController);
    
    return viewController;
}



//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    //    NSLog(@"I am %@",NSStringFromClass([self class]));
//    
//    return UIStatusBarStyleLightContent;
//}


@end


@implementation UIViewController (TKLevel)

-(UIViewController *)tk_topLevelController
{
    if (self.parentViewController == nil) {
        
        return self;
    }
    
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]
        || [self.parentViewController isKindOfClass:[UITabBarController class]]) {
        
        return self;
    }
    
    // 进行递归返回
    return self.parentViewController.tk_topLevelController;
}


-(void)tk_topNavigationPushViewController:(__kindof UIViewController *)viewController animated:(BOOL)animated
{
    if (!self.tk_topLevelController.navigationController) {//不存在导航
        
        return;
    }
    
    [self.tk_topLevelController.navigationController pushViewController:viewController animated:animated];
}

@end
