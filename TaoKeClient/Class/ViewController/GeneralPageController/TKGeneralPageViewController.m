//
//  TKGeneralPageViewController.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKGeneralPageViewController.h"
#import "TKScrollPageViewController.h"
#import <Masonry.h>

#define TKGeneralPageViewController_Margin (10)

@interface TKNavigationView : UIView

@end

@implementation TKNavigationView

@end



@interface TKGeneralPageViewController ()<TKScrollHorizontalPageDelegate,LLSegmentBarDelegate>

/// 导航栏顶部的segmentBar
@property (nonatomic, strong, readwrite) LLSegmentBar *segmentBar;

/// 放置在navigationBar上的view
@property (nonatomic, strong) TKNavigationView * navigationBarView;

/// 底部的滚动视图
@property (nonatomic, strong) TKScrollHorizontalPageViewController *pageController;


@end

@implementation TKGeneralPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setTintColor:UIColor.whiteColor];
    self.navigationItem.titleView = self.navigationBarView;

    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self buildLayouts];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [self.pageController removeFromParentViewController];
}



- (void)buildLayouts
{
    [self.segmentBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.offset(0);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(TKScale(260));
    }];
    
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.offset(0);
        make.bottom.offset(-TK_DefaultTabBarHeight);
    }];
    
    if (TK_iOS_Version_GreaterThanOrEqualTo(11.0)) {
        
        [self.navigationBarView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.offset(0);
            make.right.offset(-60);
            make.height.mas_equalTo(44);
        }];
    }
}



- (void)setContentViewControllers:(NSArray<UIViewController *> *)contentViewControllers
{
    _contentViewControllers = contentViewControllers;
    self.pageController.contentViewControllers = contentViewControllers;
}


- (void)setSegmentBarTitles:(NSArray<NSString *> *)segmentBarTitles
{
    _segmentBarTitles = segmentBarTitles;
    self.segmentBar.items = segmentBarTitles;
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






#pragma mark - getter

- (TKNavigationView *)navigationBarView
{
    if (!_navigationBarView) {
        
        _navigationBarView = [[TKNavigationView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.tk_width - 60, 44)];
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
        _segmentBar.borderMargin = TKScale(10);
        _segmentBar.buttonsMargin = TKScale(20);
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

@end
