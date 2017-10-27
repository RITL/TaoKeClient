//
//  TKViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"
#import "TKPageManager.h"
#import "UIColor+ImageGenerate.h"

@interface TKViewController ()

@end


@implementation TKViewController

- (instancetype)init
{
    if (self = [super init]) {
        
        [self loadPropertysAtInitialization];
    }
    
    return self;
}


- (void)loadPropertysAtInitialization
{
    
}


- (void)doNothing
{
    
}


 - (void)actionBackItemInNavigationBar
{
    if (self.navigationController) {
        
        [self.navigationController popViewControllerAnimated:true];
        
    }else {
        
        [self dismissViewControllerAnimated:true completion:nil];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:UIColor.whiteColor];
    
    if (@available(iOS 11.0,*)) {
        
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /// 追踪
    [TKPageManager sharedInstance].currentViewController = self;

    [self tk_setCustomNavigationBarProperty];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (UIColor *)tk_customColorForNavigationShadow
{
    return TKNavigationBarNormalColor;
}

- (UIColor *)tk_customColorForNavigationBarText
{
    return UIColor.whiteColor;
}

- (UIImage *)tk_customBackIndicatorImage
{
    return [UIImage imageNamed:@"navigationbar_white_back"];
}

-(UIImage *)tk_customBackIndicatorTransitionMaskImage
{
    return [self tk_customBackIndicatorImage];
}

-(UIFont *)tk_customFontInNavigationBar
{
    return TKUtilityFont(TKFontPingFangSC_Medium, 16);
}

- (UIColor *)tk_customColorForNavigationBar
{
    return TKNavigationBarNormalColor;
}

@end





@implementation TKViewController (TKNavigationBarController)

/// 设置导航栏的属性
- (void)tk_setCustomNavigationBarProperty
{
    //如果存在方法
    if ([self respondsToSelector:@selector(tk_customColorForNavigationBar)]) {
        
        if (self.tk_customColorForNavigationBar) {
            
            // 导航栏的背景色
            [self.navigationController.navigationBar setBackgroundImage:self.tk_customColorForNavigationBar.jp_image forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    else {
        
        //获得拉伸图片
        //        UIImage *image = [[UIImage imageNamed:@"navigationbar_backgroundImage"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        //        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    
    [self.navigationController.navigationBar setShadowImage:self.tk_customColorForNavigationShadow.jp_image];
    
    
    // 导航栏标题的文字颜色
    [self.navigationController.navigationBar setTintColor:self.tk_customColorForNavigationBarText];
    
    
    // 设置返回的图标
    if (self.tk_customBackIndicatorImage)
    {
        [self.navigationController.navigationBar setBackIndicatorImage:self.tk_customBackIndicatorImage];
    }
    
    if (self.tk_customBackIndicatorTransitionMaskImage)
    {
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:self.tk_customBackIndicatorTransitionMaskImage];
    }
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[self tk_customColorForNavigationBarText],NSFontAttributeName:[self tk_customFontInNavigationBar]}];
}


@end
