//
//  UMSocialUIManager+TKExtension.m
//  TaoKeClient
//
//  Created by YueWen on 2017/11/1.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UMSocialUIManager+TKExtension.h"
#import "TKRuntimeTool.h"

@implementation UMSocialUIManager (TKExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        TK_swizzledClassSelector(UMSocialUIManager.class, sel_registerName("showShareMenuViewInWindowWithPlatformSelectionBlock:"), sel_registerName("tk_showShareMenuViewInWindowWithPlatformSelectionBlock:"));
    });
}

+ (void)tk_showShareMenuViewInWindowWithPlatformSelectionBlock:(UMSocialSharePlatformSelectionBlock)sharePlatformSelectionBlock
{
    [self tk_showShareMenuViewInWindowWithPlatformSelectionBlock:sharePlatformSelectionBlock];
    
    //如果不是iPhoneX
    if (!TK_iPhoneX) {  return; }
    
    //如果是iPhoneX，进行高度以及坐标修改
    [self tk_fitIPhoneX];
}



+ (void)tk_fitIPhoneX
{
    //获得GroupView
//    UIView *groupView = self.tk_UMSocialSharePageGroupView;
    
    UMSocialShareUIConfig *defaultConfig = [UMSocialShareUIConfig shareInstance];
    
    //设置
    UMSocialShareContainerConfig *containerConfig = defaultConfig.shareContainerConfig;
    
    //修改属性
    containerConfig.shareContainerMarginBottom = TK_iPhoneXSafeDistance;
    
//    //修改高度
//    groupView.tk_height += TK_iPhoneXDistance;
//    groupView.tk_originY -= TK_iPhoneXDistance;
//
//    //获得ShareContainer
//    UIView *shareContainer = self.tk_UMSocialShareContainer;
//
//    //修改高度
//    shareContainer.tk_height += TK_iPhoneXDistance;
//    shareContainer.tk_originY -= TK_iPhoneXDistance;

}




//
//+ (UIView *)tk_UMSocialSharePageGroupView
//{
//    return [[UIApplication sharedApplication].keyWindow.subviews tk_filter:^BOOL(__kindof UIView * _Nonnull view) {
//
//        return [view isKindOfClass:NSClassFromString(@"UMSocialSharePageGroupView")];
//
//    }].tk_safeFirstObject;
//}
//
//
//+ (UIView *)tk_UMSocialShareContainer
//{
//    return [self.tk_UMSocialSharePageGroupView.subviews tk_filter:^BOOL(__kindof UIView * _Nonnull view) {
//
//        return [view isKindOfClass:NSClassFromString(@"UMSocialShareContainer")];
//
//    }].tk_safeFirstObject;
//}

@end
