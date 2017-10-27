//
//  TKAppConfig.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#ifndef TKAppConfig_h
#define TKAppConfig_h


/// 淘客的主题灰
#define TKGrayColor (TKColorFromRGB(0x666666))

/// 主题红
#define TKThemeColor (TKColorFromRGB(0xe41d22))

/// 大标题的默认色
#define TKGeneralTitleColor (TKColorFromRGB(0x464646))

/// 底部tabBar的选中颜色
#define TKTabBarTintNormalColor (TKColorFromRGB(0xe41d22))

/// 导航栏bar的正常色
#define TKNavigationBarNormalColor (TKColorFromRGB(0xe41d22))

/// imageView的占位背景色
#define TKImageViewPlaceHolderColor (TKColorFromRGB(0xedefee))

/// 主页推荐的背景色
#define TKAllCategorySegmentBackgroundColor (TKColorFromRGB(0xebbc8f))


/// font
static NSString *const TKFontPingFangSC_Regular = @"PingFangSC-Regular";
static NSString *const TKFontPingFangSC_Medium = @"PingFangSC-Medium";
static NSString *const TKFontPingFangSC_Bold = @"PingFangSC-Bold";


///Const DictionaryKey

//Key
static NSString *const TKConstDictionaryKeyPlatform = @"platform";
static NSString *const TKConstDictionaryKeyTitle = @"title";
static NSString *const TKConstDictionaryKeyUrl = @"url";

// Platform Value
static NSString *const TKConstDictionaryValueKeyWeb = @"web";
static NSString *const TKConstDictionaryValueKeyShare = @"share";
static NSString *const TKConstDictionaryValueKeySearch = @"search";



/// Custom

static NSString *const TKConstSearchPlaceHolder = @"请输入搜索内容";

#endif /* TKAppConfig_h */
