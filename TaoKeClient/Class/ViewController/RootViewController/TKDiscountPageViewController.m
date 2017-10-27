//
//  TKDiscountPageViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKDiscountPageViewController.h"
#import "LLSegmentBar.h"
#import "UINavigationBar+TKExtension.h"
#import "TKAllCategoryViewController.h"
#import "TKGeneralTableViewController.h"
#import <Masonry.h>


@interface TKDiscountPageViewController ()


@end

@implementation TKDiscountPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"discount_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchMessage)];
    
    [self addSubViewControllers];
}


- (void)searchMessage
{
    [self sendMessageToPageManager:@{TKConstDictionaryKeyPlatform : TKConstDictionaryValueKeySearch}];
}


- (void)addSubViewControllers
{
    TKAllCategoryViewController *allCategoryController = [TKAllCategoryViewController new];
    
    //9块9
    TKGeneralTableViewController *nineController = [TKGeneralTableViewController new];
    nineController.request_url = TKBaseUrlAppendTo(@"/api.php?m=Api&a=getnine");
    
    //一元购
    TKGeneralTableViewController *oneController = [TKGeneralTableViewController new];
    oneController.request_url = TKBaseUrlAppendTo(@"/api.php?m=Api&c=Index&a=getone");
    
    
    self.contentViewControllers = @[allCategoryController,nineController,oneController];
    self.segmentBarTitles = @[@"全部&分类",@"9块9",@"一元购"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

