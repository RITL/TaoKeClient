//
//  TKShareWebViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKShareWebViewController.h"
#import "TKViewController.h"

@interface TKShareWebViewController ()

@end

@implementation TKShareWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_share"] style:UIBarButtonItemStylePlain target:self action:@selector(shareMessage)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)shareMessage
{
    [self sendMessageToPageManager:@{TKConstDictionaryKeyPlatform: TKConstDictionaryValueKeyShare}];
}

@end
