
//  TKPageManager.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/8/8.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKPageManager.h"
#import "TKShareManager.h"
#import "TKShareWebViewController.h"
#import "TKCategoryViewController.h"
#import "TKLoadLocalCSSWebViewController.h"

#import <JPNavigationControllerKit.h>
#import <PYSearch.h>
#import <objc/message.h>


NSString *TKPageManagerHandlerPlatformKey = @"platform";

/// 处理跳转逻辑的handler
@interface TKPageManagerHandler : NSObject


@property (class, nonatomic, weak, nullable, readonly)UIViewController *viewController;

/**
 进行逻辑界面跳转的方法
 
 @param object 响应来源
 @param info 响应信息，TKPageManagerHandlerPlatformKey:不存在，则不响应
 */
+ (void)pageManagerHandlerFromObject:(nullable id)object info:(NSDictionary *)info;

@end




@implementation TKPageManager

+ (instancetype)sharedInstance
{
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [self new];
    });
    
    return manager;
}


-(void)setCurrentViewController:(UIViewController *)currentViewController
{
    _currentViewController = currentViewController;
}



+ (void)pageManagerFromObject:(id)object info:(NSDictionary *)info
{
    ((void(*)(Class,SEL,id,id))objc_msgSend)([TKPageManagerHandler class],sel_registerName("pageManagerHandlerFromObject:info:"),object,info);

}


@end








@implementation TKPageManagerHandler


+ (UIViewController *)viewController
{
    return [TKPageManager sharedInstance].currentViewController;
}


+ (void)pageManagerHandlerFromObject:(id)object info:(NSDictionary *)info
{
    if (![info valueForKey:TKPageManagerHandlerPlatformKey]) {

        return;
    }
    
    //进行判定
    [self p_infoHandlerFromObject:object info:info];
}





/// 根据info字典进行不同的处理方案
+ (void)p_infoHandlerFromObject:(id)fromObject info:(NSDictionary *)infoDict
{
    NSString *platform = infoDict[TKConstDictionaryKeyPlatform];
    
    UIViewController *viewController = self.viewController;
    
#pragma mark - Web界面
    if ([platform isEqualToString:TKConstDictionaryValueKeyWeb]) {
        
        [viewController tk_topNavigationPushViewController:[TKShareWebViewController viewController:^(__kindof TKShareWebViewController * _Nonnull viewController) {
            
            viewController.hidesBottomBarWhenPushed = true;
            viewController.url = infoDict[TKConstDictionaryKeyUrl];
            viewController.title = infoDict[TKConstDictionaryKeyTitle];
            
        }] animated:true];
    }
    
#pragma mark - 本地固定的web界面
    else if([platform isEqualToString:TKConstDictionaryValueKeyLocalWeb]){
        
        [viewController tk_topNavigationPushViewController:[TKLoadLocalCSSWebViewController viewController:^(__kindof TKLoadLocalCSSWebViewController * _Nonnull viewController) {
            
            viewController.hidesBottomBarWhenPushed = true;
            viewController.good = TKEnityCreateWithData(infoDict[TKConstDictionaryKeyCategoryInfo]);
            
        }] animated:true];
        
    }
    
#pragma mark - Share(分享操作)
    else if([platform isEqualToString:TKConstDictionaryValueKeyShare]){
        
        [TKShareManager sharedWebMessage:infoDict atViewController:viewController];
        
    }
    
    
#pragma mark - 搜索界面
    else if([platform isEqualToString:TKConstDictionaryValueKeySearch]){
        
        [viewController presentViewController:[[JPNavigationController alloc] initWithRootViewController:[PYSearchViewController viewController:^(__kindof PYSearchViewController * _Nonnull viewController) {
            
            viewController.searchBar.placeholder = TKConstSearchPlaceHolder;
            
        }]] animated:false completion:nil];
    }
    
#pragma mark - 分类界面
    else if([platform isEqualToString:TKConstDictionaryValueKeyCategory]) {
        
        id <TKCategoryTitle>item = infoDict[TKConstDictionaryKeyCategoryTitle];
        
        //进行视图弹出
        [viewController tk_topNavigationPushViewController:[TKCategoryViewController viewController:^(__kindof TKCategoryViewController * _Nonnull viewController) {
            
            //设置属性
            viewController.category = item;
            viewController.hidesBottomBarWhenPushed = true;
            
        }] animated:true];
    }
    
}


@end
