//
//  CAGradientLayer+TKGradientLayer.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/6/23.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "CAGradientLayer+TKGradientLayer.h"

@implementation CAGradientLayer (TKGradientLayer)


+(instancetype)tk_GradientLayer:(CGRect)bounds
{
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.bounds = bounds;
//    
//    //设置渐变色
//    [gradientLayer setColors:@[(id)(TKCAGradientLayerBeginColor.CGColor),(id)(TKCAGradientLayerEndColor).CGColor)]];
//    
//    gradientLayer.anchorPoint = CGPointMake(0, 0);
//    gradientLayer.startPoint = CGPointMake(0, 0.5);
//    gradientLayer.endPoint = CGPointMake(1, 0.5);
//    
//    return gradientLayer;
//    
//    
    return [self tk_GradientLayer:bounds FirstColor:TKCAGradientLayerBeginColor SecondColor:TKCAGradientLayerEndColor];
}

+(instancetype)tk_GradientLayer:(CGRect)bounds FirstColor:(UIColor *)firstColor SecondColor:(UIColor *)secondColor
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = bounds;
    
    //设置渐变色
    [gradientLayer setColors:@[(id)(firstColor.CGColor),(id)(secondColor.CGColor)]];
    
    gradientLayer.anchorPoint = CGPointMake(0, 0);
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    return gradientLayer;
}

@end


@implementation UINavigationController (TKNavigationBarCAGradientLayer)


-(CAGradientLayer *)tk_firstGradientLayer
{
    if (!self.tk_gradinentLayers || self.tk_gradinentLayers.count == 0) {
        
        return nil;
    }
    
    
    return self.tk_gradinentLayers.firstObject;
}



-(NSArray<CAGradientLayer *> *)tk_gradinentLayers
{
    return [self.navigationBar.layer.sublayers tk_filter:^BOOL(id _Nonnull layer) {
        
        return [layer isKindOfClass:[CAGradientLayer class]];
    }];
}

@end
