//
//  UIView+TKFrameChanged.m
//  TKPhotoDemo
//
//  Created by YueWen on 2017/3/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UIView+TKFrameChanged.h"

@implementation UIView (TKFrameChanged)


#pragma mark - Getter

-(CGSize)tk_size
{
    return self.bounds.size;
}

-(CGPoint)tk_originPoint
{
    return self.frame.origin;
}

-(CGFloat)tk_originX
{
    return self.tk_originPoint.x;
}

-(CGFloat)tk_originY
{
    return self.tk_originPoint.y;
}

-(CGFloat)tk_width
{
    return self.tk_size.width;
}

-(CGFloat)tk_height
{
    return self.tk_size.height;
}

-(CGFloat)tk_centerX
{
    return self.center.x;
}

-(CGFloat)tk_centerY
{
    return self.center.y;
}

-(CGFloat)tk_maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)tk_maxY
{
    return CGRectGetMaxY(self.frame);
}

-(CGFloat)tk_minX
{
    return CGRectGetMinX(self.frame);
}

-(CGFloat)tk_minY
{
    return CGRectGetMinY(self.frame);
}

-(CGFloat)tk_midX
{
    return CGRectGetMidX(self.frame);
}

-(CGFloat)tk_midY
{
    return CGRectGetMidY(self.frame);
}


#pragma mark - Setter

-(void)setTk_size:(CGSize)tk_size
{
    CGRect frame = self.frame;
    
    frame.size = tk_size;
    
    self.frame = frame;
}



-(void)setTk_originPoint:(CGPoint)tk_originPoint
{
    CGRect frame = self.frame;
    
    frame.origin = tk_originPoint;
    
    self.frame = frame;
}


-(void)setTk_originX:(CGFloat)tk_originX
{
    [self setTk_originPoint:CGPointMake(tk_originX, self.tk_originY)];
}


-(void)setTk_originY:(CGFloat)tk_originY
{
    [self setTk_originPoint:CGPointMake(self.tk_originX, tk_originY)];
}

-(void)setTk_width:(CGFloat)tk_width
{
    [self setTk_size:CGSizeMake(tk_width, self.tk_height)];
}


-(void)setTk_height:(CGFloat)tk_height
{
    [self setTk_size:CGSizeMake(self.tk_width, tk_height)];
}

-(void)setTk_centerX:(CGFloat)tk_centerX
{
    self.center = CGPointMake(tk_centerX, self.tk_centerY);
}

-(void)setTk_centerY:(CGFloat)tk_centerY
{
    self.center = CGPointMake(self.tk_centerX, tk_centerY);
}

@end

@implementation UIViewController (TKFrameChanged)


-(CGFloat)tk_height
{
    return self.view.tk_height;
}

-(CGFloat)tk_width
{
    return self.view.tk_width;
}

@end

@implementation UIScreen (TKFrameChanged)

-(CGFloat)tk_height
{
    return self.bounds.size.height;
}

-(CGFloat)tk_width
{
    return self.bounds.size.width;
}

-(CGFloat)tk_width_scale
{
    return self.tk_width / 375.0;
}

@end

@implementation UIScrollView (TKFrameChanged)

-(CGFloat)tk_contentOffSetX
{
    return self.contentOffset.x;
}

-(CGFloat)tk_contentOffSetY
{
    return self.contentOffset.y;
}

-(CGFloat)tk_contentSizeWidth
{
    return self.contentSize.width;
}

-(CGFloat)tk_contentSizeHeight
{
    return self.contentSize.height;
}


-(void)setTk_contentOffSetX:(CGFloat)tk_contentOffSetX
{
    [self setTk_contentOffSetX:tk_contentOffSetX animated:false];
}


-(void)setTk_contentOffSetY:(CGFloat)tk_contentOffSetY
{
    [self setTk_contentOffSetY:tk_contentOffSetY animated:false];
}


-(void)setTk_contentOffSetX:(CGFloat)tk_contentOffSetX animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(tk_contentOffSetX, self.tk_contentOffSetY) animated:animated];
}


-(void)setTk_contentOffSetY:(CGFloat)tk_contentOffSetY animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.tk_contentOffSetX, tk_contentOffSetY) animated:animated];
}


-(void)setTk_contentSizeWidth:(CGFloat)tk_contentSizeWidth
{
    self.contentSize = CGSizeMake(tk_contentSizeWidth, self.tk_contentSizeHeight);
}


-(void)setTk_contentSizeHeight:(CGFloat)tk_contentSizeHeight
{
    self.contentSize = CGSizeMake(self.tk_contentSizeWidth, tk_contentSizeHeight);
}


@end


@implementation UIView (TKSimpleInit)

+ (instancetype)tk_viewInstanceTypeHandler:(void (^)(__kindof UIView * _Nonnull))viewHandler
{
    id view = [[[self class] alloc]initWithFrame:CGRectZero];
    
    viewHandler(view);
    
    return view;
}


+ (instancetype)tk_viewInstanceFrame:(CGRect)frame initizationHandler:(void (^)(__kindof UIView * _Nonnull))viewHandler
{
    id view = [[[self class] alloc]initWithFrame:frame];
    
    viewHandler(view);
    
    return view;
}


/// 修改frame返回自己
- (instancetype)viewChangedFrame:(CGRect)frame
{
    self.frame = frame;
    
    return self;
}


@end





//@implementation UINavigationController (TK)
//
////-(UIStatusBarStyle)preferredStatusBarStyle
////{
////    NSLog(@"I am %@",NSStringFromClass([self class]));
////    
////    return UIStatusBarStyleLightContent;
////}
//
//
//@end


//@implementation UITabBarController (TK)
//
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    NSLog(@"I am %@",NSStringFromClass([self class]));
//    
//    return UIStatusBarStyleLightContent;
//}
//
//
//@end
