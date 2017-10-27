//
//  TKCategoryViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKCategoryViewController.h"

@interface TKCategoryViewController ()

@end

@implementation TKCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.category.cname;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSDictionary *)additionInfo
{
    if (!self.category.cid) { return @{}; }
    
    return @{@"cid":self.category.cid};
}


- (NSString *)request_url
{
    return TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=getcatgoods");
}

@end
