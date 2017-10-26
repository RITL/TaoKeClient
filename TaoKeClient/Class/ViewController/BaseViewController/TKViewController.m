//
//  TKViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKViewController.h"
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
    
    if (@available(iOS 11.0,*)) {
        
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航
    [self.navigationController.navigationBar setBackgroundImage:TKNavigationBarNormalColor.jp_image forBarMetrics:UIBarMetricsDefault];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
