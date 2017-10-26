//
//  TKNavigationBarController.h
//  YueWen
//
//  Created by YueWen on 2016/12/5.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TKNavigationBarController <NSObject>


@optional

/**
 自定义的导航栏的颜色
 
 @return 导航栏的颜色
 */
- (UIColor *)tk_customColorForNavigationBar;


/**
 自定义导航栏阴影的颜色
 
 @return 导航栏阴影的颜色
 */
- (UIColor *)tk_customColorForNavigationShadow;


/**
 自定义的导航栏标题的颜色
 
 @return 标题的颜色
 */
- (UIColor *)tk_customColorForNavigationBarText;


/**
 返回按钮的图片

 @return 按钮返回的图片
 */
- (UIImage *)tk_customBackIndicatorImage;



/**
 转换过程中返回的图片

 @return 转换过程中返回的图片
 */
- (UIImage *)tk_customBackIndicatorTransitionMaskImage;



/**
 导航标题的字体

 @return 导航标题的字体
 */
- (UIFont *)tk_customFontInNavigationBar;


///// 导航栏的背景色
//- (UIColor *)tk_navigationBarColor;
//
//
///// 导航栏的标题颜色
//- (UIColor *)tk_navigationBarTitleColor;

@end
