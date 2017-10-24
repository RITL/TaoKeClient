//
//  UINavigationController+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UINavigationController+TKExtension.h"

@implementation UINavigationController (TKPreferredStatusBarStyle)

- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIViewController *viewController = self.visibleViewController;
    
    return viewController.preferredStatusBarStyle;
}


@end
