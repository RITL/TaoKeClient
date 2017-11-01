//
//  TKShareManager.m
//  TaoKeClient
//
//  Created by YueWen on 2017/11/1.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKShareManager.h"
#import <UShareUI/UShareUI.h>

@implementation TKShareManager

+ (instancetype)sharedInstance
{
    static id manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [self new];
    });
    
    return manager;
}


+ (void)sharedWebMessage:(NSDictionary *)info atViewController:(UIViewController *)viewController
{
    NSArray *definePlatforms = @[@(UMSocialPlatformType_WechatTimeLine),
                                 @(UMSocialPlatformType_WechatSession),
                                 @(UMSocialPlatformType_Sina)];
    
    //设置类型
    [UMSocialUIManager setPreDefinePlatforms:definePlatforms];
    
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        [[TKShareManager sharedInstance] socialPlatformHandler:platformType Info:userInfo];
        
    }];
}



- (void)socialPlatformHandler:(UMSocialPlatformType)platformType Info:(NSDictionary *)userInfo
{
    switch (platformType) {
            
        case UMSocialPlatformType_WechatTimeLine:
            [self wechatTimeLineHandler:userInfo];  break;
            
        case UMSocialPlatformType_WechatSession:
            [self wechatSessionHandler:userInfo];  break;
            
        case UMSocialPlatformType_Sina:
            [self sinaHandler:userInfo]; break;
            
        default: break;
    }
}


/// 微信聊天分享
- (void)wechatTimeLineHandler:(NSDictionary *)info
{
    
}

/// 朋友圈分享
- (void)wechatSessionHandler:(NSDictionary *)info
{
    
}

/// 新浪微博分享
- (void)sinaHandler:(NSDictionary *)info
{
    
}



@end
