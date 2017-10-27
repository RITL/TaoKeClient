//
//  TKRootTabBarController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKRootTabBarController.h"
#import "TKDiscountViewController.h"
#import "TKViewController.h"
#import <JPNavigationControllerKit.h>

@interface TKRootTabBarController ()

@end

@implementation TKRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = TKTabBarTintNormalColor;
    
    
    //初始化优惠券
    TKViewController *rootDiscount = [TKDiscountViewController new];
    JPNavigationController *discount = [[JPNavigationController alloc]initWithRootViewController:rootDiscount];
    discount.tabBarItem.title = @"优惠券";
    
    
    //初始化精选
    TKViewController *rootChoicenes = [TKViewController new];
    JPNavigationController *choicenes = [[JPNavigationController alloc]initWithRootViewController:rootChoicenes];
    choicenes.tabBarItem.title = @"精选";
    
    //追加两个控制器
    [self addChildViewController:discount];
    [self addChildViewController:choicenes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


@end
