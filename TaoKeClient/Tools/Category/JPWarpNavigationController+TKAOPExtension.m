//
//  JPWarpNavigationController+TKAOPExtension.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/9/15.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "JPWarpNavigationController+TKAOPExtension.h"
#import "TKRuntimeTool.h"
#import <UIColor+ImageGenerate.h>
#import <objc/message.h>
#import <JPNavigationController.h>
#import <UIViewController+ViewControllers.h>
#import <JPWarpViewController.h>
#import <UIView+ScreenCapture.h>

@implementation JPWarpNavigationController (TKAOPExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        TK_swizzledInstanceSelector([self class], @selector(viewDidLoad), @selector(tk_viewDidLoad));
        TK_swizzledInstanceSelector([self class], @selector(pushViewController:animated:), @selector(tk_pushViewController:animated:));
        
    });

}


- (void)tk_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // call -initWithRootViewController: first view controller push in stack.
    JPNavigationController *rootNavigationController = [self valueForKey:@"rootNavigationController"];
    if (!rootNavigationController) {
        [super pushViewController:viewController animated:animated];
        return;
    }
    
    // call pushViewController:animated:.
    viewController.jp_rootNavigationController = rootNavigationController;
    
    UIImage *backImg = [[UIImage imageNamed:@"JPNavigationController.bundle/backImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:backImg style:UIBarButtonItemStylePlain target:self action:NSSelectorFromString(@"didTapBackButton")];
    
#pragma mark - 淘客自定义
    
    //如果该控制器有自定义的方法tk_customBackIndicatorImage
    if ([viewController respondsToSelector:NSSelectorFromString(@"tk_customBackIndicatorImage")]) {
        
        //执行
        UIImage *image = ((UIImage*(*)(id,SEL))objc_msgSend)(viewController,NSSelectorFromString(@"tk_customBackIndicatorImage"));
        
        backImg = image ? [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] : backImg;
    }
    
    //如果自己有actionBackItemInNavigationBar方法，执行
    if ([viewController respondsToSelector:NSSelectorFromString(@"actionBackItemInNavigationBar")]) {
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:backImg style:UIBarButtonItemStylePlain target:viewController action:NSSelectorFromString(@"actionBackItemInNavigationBar")];
        
    }else {
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:backImg style:UIBarButtonItemStylePlain target:self action:NSSelectorFromString(@"didTapBackButton")];
    }
    
    
    
    JPWarpViewController *warpViewController = [[JPWarpViewController alloc]initWithRootViewController:viewController rootNavigationController:rootNavigationController];
    
    // capture screen for custom pop if need.
    if (self.view.window) {
        viewController.jp_screenCaptureImg = [self.view.window jp_captureCurrentView];
    }
    
    [rootNavigationController pushViewController:warpViewController animated:animated];
}


- (void)tk_viewDidLoad {
    [super viewDidLoad];
    
    // Replace system's NavigationBar with custom NavigationBar.
    // default color for navigation bar.
    [self.navigationBar setBackgroundImage:[[UIColor whiteColor] jp_image] forBarMetrics:UIBarMetricsDefault];
}

@end
