//
//  TKUtility.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/21.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKUtility.h"

@implementation TKUtility

+ (UIFont *)checkWhetherExistFontWithName:(NSString *)fontName AndSize:(CGFloat)size
{
    UIFont *checkFont = [UIFont fontWithName:fontName size:size];
    if (checkFont == nil) {
        if ([fontName containsString:@"Bold"]) {
            checkFont = [UIFont boldSystemFontOfSize:size];
        } else {
            checkFont = [UIFont systemFontOfSize:size];
        }
    }
    return checkFont;
}

@end


UIFont *TKUtilityFont(NSString *fontName,CGFloat size)
{
    return [TKUtility checkWhetherExistFontWithName:fontName AndSize:size];
}

