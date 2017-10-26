//
//  TKDiscountViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKDiscountViewController.h"
#import "LLSegmentBar.h"
#import "TKAllCategoryViewController.h"
#import "TKGeneralTableViewController.h"
#import "TKScrollPageViewController.h"
#import <Masonry.h>

#define TKDiscountViewController_Margin (10)

@interface TKDiscountViewController () <TKScrollHorizontalPageDelegate,LLSegmentBarDelegate>

/// 放置在navigationBar上的view
@property (nonatomic, strong) UIView * navigationBarView;

/// 底部的滚动视图
@property (nonatomic, strong) TKScrollHorizontalPageViewController *pageController;

@end

@implementation TKDiscountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:UIColor.whiteColor];
    self.navigationItem.titleView = self.navigationBarView;
    
    /// 右侧搜索
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"discount_search"] style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self buildLayouts];
    
    //追加view
    [self addSubViewControllers];
}


- (void)buildLayouts
{
    [self.segmentBar mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.left.offset(0);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(260);
    }];
    
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.offset(0);
        make.bottom.offset(-TK_DefaultTabBarHeight);
    }];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //重置navigationBarView
    self.navigationBarView.tk_originX = TKScale(10);
    self.navigationBarView.tk_width = self.navigationController.navigationBar.tk_width - self.navigationBarView.tk_originY - 60;
    self.navigationBarView.tk_originY = self.navigationController.navigationBar.tk_height - self.navigationBarView.tk_height;
}


- (void)dealloc
{
    [self.pageController removeFromParentViewController];
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
    
    
    self.pageController.contentViewControllers = @[allCategoryController,nineController,oneController];
}



- (UIView *)navigationBarView
{
    if (!_navigationBarView) {
        
        _navigationBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
        _navigationBarView.backgroundColor = TKNavigationBarNormalColor;
        
        [_navigationBarView addSubview:self.segmentBar];
    }
    
    return _navigationBarView;
}


- (LLSegmentBar *)segmentBar
{
    if (!_segmentBar) {
        
        _segmentBar = [LLSegmentBar segmentBarWithFrame:CGRectZero];
        
        //设置属性
        _segmentBar.items = @[@"全部&分类",@"9块9",@"一元购"];
        _segmentBar.isSimpleView = true;
        _segmentBar.borderMargin = 23;
        _segmentBar.buttonsMargin = 15;
        _segmentBar.indicatorFitTitle = false;
        _segmentBar.delegate = self;
        
        [_segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
            
            config.
            itemNormalColor(UIColor.whiteColor).
            itemSelectColor(UIColor.whiteColor).
            segmentBarBackColor(TKNavigationBarNormalColor).
            indicatorColor(UIColor.whiteColor);
        }];
    }
    
    return _segmentBar;
}



- (TKScrollHorizontalPageViewController *)pageController
{
    if (!_pageController) {
        
        _pageController = [TKScrollHorizontalPageViewController new];
        _pageController.segmentBar.tk_height = 0;
        _pageController.segmentBar.hidden = true;
        _pageController.tk_delegate = self;

    }
    
    
    return _pageController;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TKScrollHorizontalPageDelegate

- (void)tk_scrollHorizontalPageViewController:(TKScrollHorizontalPageViewController *)viewController
                                  willToIndex:(NSInteger)index
{
    [self.segmentBar changedSelectedOnlyWithIndex:index];
}


#pragma mark - LLSegmentBarDelegate

- (void)segmentBar:(LLSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    [self.pageController setCurrentViewController:self.pageController.contentViewControllers[toIndex]];
}

@end

