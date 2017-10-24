//
//  TKUtility.h
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH_SCALE ([UIScreen mainScreen].bounds.size.width/320.0f)
#define SCREEN_HEIGHT_SCALE ([UIScreen mainScreen].bounds.size.height/568.0f)
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


#define TK_iPhoneX ((SCREEN_WIDTH == 375) && (SCREEN_HEIGHT == 812))
#define TK_DefaultTabBarHeight (TK_iPhoneX ? 83 : 49)


#define tk_dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}


#define tk_dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}


#define TKSafeString(x) (x ? x : @"")
#define TK_iOS_Version_GreaterThanOrEqualTo(x) (UIDevice.currentDevice.systemVersion.floatValue >= x)


#pragma mark - color

// 颜色转换
#define TKRGBACOLOR(r,g,b,a)\
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



// RGB颜色转换（16进制->10进制）
#define TKColorFromRGB(rgbValue)\
TKRGBACOLOR(((float)((rgbValue & 0xFF0000) >> 16)),((float)((rgbValue & 0xFF00) >> 8)),((float)(rgbValue & 0xFF)),1.0)


// RGB颜色转换
#define TKColorFromIntRBG(RED, GREEN, BLUE) TKRGBACOLOR(RED,GREEN,BLUE,1.0)




#pragma mark - 网络请求

/// 网络请求的拼接
#define TKBaseUrlAppendTo(x) ([NSString stringWithFormat:@"%@%@",TKRequestBaseUrl,x])
#define TKRequestBaseUrl (@"http://fulihot.lixiaopeng.top")




/**
 根据设计图比例进行缩放
 
 @param origin 缩放的变量
 @return 缩放后的大小
 */
inline static CGFloat TKScale(CGFloat origin)
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    return (screenWidth * origin) / 375;
    
}

/// 根据Android获得的距离
inline static CGFloat TKTestScale(CGFloat origin)
{
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    return (334 * origin) / 375;
}


NS_ASSUME_NONNULL_BEGIN

/// 工具列
@interface TKUtility : NSObject

+ (UIFont *)checkWhetherExistFontWithName:(NSString *)fontName AndSize:(CGFloat)size;

@end


extern UIFont *TKUtilityFont(NSString *fontName,CGFloat size);

NS_ASSUME_NONNULL_END
