//
//  TKScrollPageViewController.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/9/4.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKScrollPageViewController.h"

@interface TKScrollPageViewController ()<UIGestureRecognizerDelegate>

/// 自定义的滑动手势
@property (nonatomic, strong)UIPanGestureRecognizer *tk_panGestureRecognizer;

@end


@implementation TKScrollPageViewController

-(instancetype)init
{
    if (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:self.orientation options:nil]) {}
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置代理
    self.delegate = self.delegate ? self.delegate : self;
    self.dataSource = self.dataSource ? self.dataSource : self;
    
    
    //初始化手势
    self.tk_panGestureRecognizer = [UIPanGestureRecognizer new];
    self.tk_panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tk_panGestureRecognizer];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tk_gestureRecongnizers enumerateObjectsUsingBlock:^(UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [weakSelf.tk_panGestureRecognizer requireGestureRecognizerToFail:obj];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIPageViewControllerNavigationOrientation)orientation
{
    return UIPageViewControllerNavigationOrientationHorizontal;
}



-(NSInteger)currentIndex
{
    if (!self.currentViewController) {
        
        return NSNotFound;
    }
    
    return [self.contentViewControllers indexOfObject:self.currentViewController];
}



-(void)setContentViewControllers:(NSArray<UIViewController *> *)contentViewControllers
{
    _contentViewControllers = contentViewControllers;
    
    if (contentViewControllers.count == 0) {
        
        return;
    }
    
    [self setViewControllers:@[contentViewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:false completion:nil];
    
    self.currentViewController = contentViewControllers.firstObject;
}




-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    if (!currentViewController) {
        
        return;
    }
    

    //如果控制器一样，不作操作
    if ([currentViewController isEqual:self.currentViewController]) {
        
        return;
    }
    
    
    //获得当前的控制器
    UIViewController *lastCurrentViewController = self.currentViewController;
    
    //存在跳转的vc
    if ([self.contentViewControllers containsObject:currentViewController]) {
        
        //获得将要去的index
        NSInteger toIndex = [self.contentViewControllers indexOfObject:currentViewController];
        
        //从哪里来的index
        NSInteger fromIndex = 0;
        
        //获得准备跳转的fromIndex
        if ([self.contentViewControllers containsObject:lastCurrentViewController]) {
            
             fromIndex = [self.contentViewControllers indexOfObject:lastCurrentViewController];
        }
        
        //方向
        UIPageViewControllerNavigationDirection direction = fromIndex < toIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse;
        
        //设置
        _currentViewController = currentViewController;
        
        [self setViewControllers:@[currentViewController] direction:direction animated:false completion:nil];
    }
}


@end





@interface TKScrollHorizontalPageViewController ()


@end



@implementation TKScrollHorizontalPageViewController


- (UIPageViewControllerNavigationOrientation)orientation
{
    return UIPageViewControllerNavigationOrientationHorizontal;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.segmentBar.hidden) {
        
        [self.view addSubview:self.segmentBar];
    }
    

    [self.tk_panGestureRecognizer addTarget:self action:@selector(doSomething:)];
}


- (void)doSomething:(UIPanGestureRecognizer *)sender
{
    NSLog(@"do something");
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //选出底部视图
    UIView *scrollView = [[self.view.subviews tk_filter:^BOOL(__kindof UIView * _Nonnull view) {
        
        return [view isKindOfClass:[UIScrollView class]];
        
    }] tk_safeObjectAtIndex:0];

    //重置height
    scrollView.tk_originY = self.segmentBar.tk_height;
    scrollView.tk_height = self.tk_height - self.segmentBar.tk_height;
}


-(void)dealloc
{
//    [self.tk_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}




#pragma mark - UIGestureRecognizerDelegate


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.currentIndex != 0) {
        
        return false;
    }
    
    return true;
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //如果偏移量小于视图宽度
    if (self.currentIndex == 0 && [otherGestureRecognizer isEqual:self.popPanGestureRecognizer]) {
        
        NSLog(@"shouldRecognizeSimultaneouslyWithGestureRecognizer");
        return true;
    }
    
    return false;
}


#pragma mark - setter

- (void)setCurrentViewController:(UIViewController *)currentViewController
{
    if (!currentViewController) {
        
        return;
    }
    
    [super setCurrentViewController:currentViewController];
    
    //变化segment
    [self.segmentBar changedSelectedOnlyWithIndex:self.currentIndex];
}


#pragma mark - getter

- (LLSegmentBar *)segmentBar
{
    if (!_segmentBar) {
        
        _segmentBar = [[LLSegmentBar alloc]initWithFrame:CGRectMake(0, 0, self.tk_width, TKScale(35))];
        _segmentBar.delegate = self;

        //进行设置
        [_segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
            
            config.itemFont(TKUtilityFont(@"PingFang-SC-Regular", TKScale(14)))
            .itemNormalColor(TKColorFromIntRBG(77, 77, 77))
            .itemSelectColor(TKColorFromIntRBG(41, 195, 144))
            .indicatorColor(TKColorFromIntRBG(41, 195, 144))
            .indicatorHeight(TKScale(1.5))
            .segmentBarBackColor([UIColor whiteColor]);
        }];
    }
    
    return _segmentBar;
}



#pragma mark - LLSegmentBarDelegate
- (void)segmentBar:(LLSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    //获得将要去的viewController
    UIViewController *toViewController = [self.contentViewControllers tk_safeObjectAtIndex:toIndex];
  
    self.currentViewController = toViewController;
}





#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
    [super pageViewController:pageViewController didFinishAnimating:finished previousViewControllers:previousViewControllers transitionCompleted:completed];
    
    //进行设置
    [self.segmentBar changedSelectedOnlyWithIndex:self.currentIndex];
    
}





@end




@implementation TKScrollVerticalPageViewController


- (UIPageViewControllerNavigationOrientation)orientation
{
    return UIPageViewControllerNavigationOrientationVertical;
}


@end










@implementation UIPageViewController (TKScrollView)

-(UIScrollView *)tk_scrollView
{
    for (UIView *view in self.view.subviews) {
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            
            return (UIScrollView *)view;
        }
    }
    return nil;
}


- (UIPanGestureRecognizer *)tk_scrollPanGestureRecongnizer
{
    return [self.tk_gestureRecongnizers tk_filter:^BOOL(UIGestureRecognizer * _Nonnull gestureRecognizer) {
        
        return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
        
    }].tk_safeFirstObject;
}



- (NSArray<UIGestureRecognizer *> *)tk_gestureRecongnizers
{
    UIScrollView *scrollView = self.tk_scrollView;
    
    if (scrollView) {
        
        return scrollView.gestureRecognizers;
    }
    
    return nil;
}


@end





















@implementation TKScrollPageViewController (UIPageViewControllerDataSource)

//前一页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    //控制器索引
    NSInteger index = [self.contentViewControllers indexOfObject:viewController];
    
    if(index == 0 || index == NSNotFound) { return nil; }
    
    index--;
    
    //设置当前的控制器
    return [self.contentViewControllers objectAtIndex:index];
}




//后一页
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    //控制器索引
    NSInteger index = [self.contentViewControllers indexOfObject:viewController];
    
    if(index == NSNotFound || index == self.contentViewControllers.count - 1) {  return nil; }
    
    index++;
    
    //设置当前的控制器
    return [self.contentViewControllers objectAtIndex:index];
}


@end





@implementation TKScrollPageViewController (UIPageViewControllerDelegate)

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    //设置当前
    _currentViewController = pageViewController.viewControllers.firstObject;
    
}


@end




//@interface UIQueuingScrollView (TKScrollHorizontalPageViewController)
//
//@end
//
//
//@implementation UIQueuingScrollView(TKScrollHorizontalPageViewController)
//
//
//
//@end
