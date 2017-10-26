//
//  UINavigationBar+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/26.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UINavigationBar+TKExtension.h"
#import <Masonry.h>

@implementation UINavigationBar (TKExtension)


- (void)resetViewFrameInNavigationBar:(CGRect)frame viewClass:(Class)viewClass
{
    if (UIDevice.currentDevice.systemVersion.floatValue >= 11.0) { return; }//iOS11之后不进行操作
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj isKindOfClass:viewClass]) {
            
            obj.frame = frame;
            *stop = true;
        }
    }];
}


- (void)tk_resetViewFrameInNavigationBar:(CGRect)frame viewClass:(Class)viewClass
{
    if (UIDevice.currentDevice.systemVersion.floatValue < 11.0) {  return; }//iOS11之前不进行操作

    __block UIView *navigationBarContentView = nil;

    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
            
            navigationBarContentView = obj;
            *stop = true;
        }
    }];
    
    UIView *buttonBarStackView = nil;
    UIView *customView = nil;
    
    //再度遍历
    [navigationBarContentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
//        if (obj isKindOfClass:NSClassFromString(@"")) {
//            <#statements#>
//        }
        
        
        if ([obj isKindOfClass:viewClass]) {
            
//            obj.frame = frame;
            //删除所有的
            
            
            *stop = true;
        }
    }];
}

@end
