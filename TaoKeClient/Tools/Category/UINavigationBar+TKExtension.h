//
//  UINavigationBar+TKExtension.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/26.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UINavigationBar (TKExtension)

/**
 重新设置导航栏中类型为viewClass的第一个视图的frame

 availble(iOS 2.0,iOS 10.3)
 
 @param frame 需要设置的frame
 @param viewClass 视图的类
 */
- (void)resetViewFrameInNavigationBar:(CGRect)frame viewClass:(Class)viewClass;



/**
 重新设置导航栏中类型为viewClass的第一个视图的frame
 
 available(iOS 11.0,*)

 @param frame 需要设置的frame
 @param viewClass 视图的类
 */
- (void)tk_resetViewFrameInNavigationBar:(CGRect)frame viewClass:(Class)viewClass;


@end

NS_ASSUME_NONNULL_END
