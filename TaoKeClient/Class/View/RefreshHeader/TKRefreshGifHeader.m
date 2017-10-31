//
//  TKRefreshGifHeader.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/28.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKRefreshGifHeader.h"

@implementation TKRefreshGifHeader

- (instancetype)init
{
    if (self = [super init]) {
        
        [self buildOwnProperties];
    }
    
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self buildOwnProperties];
}



- (void)buildOwnProperties
{
    NSMutableArray < UIImage *> *images = [NSMutableArray arrayWithCapacity:0];
    
    for (NSInteger i = 1; i <= 7; i++) {
        
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"refresh_%.2ld",(long)i]]];
    }
    
    [self setImages:@[images.firstObject] forState:MJRefreshStateIdle];
    [self setImages:@[images.firstObject] forState:MJRefreshStatePulling];
    [self setImages:images.copy forState:MJRefreshStateRefreshing];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.mj_h = 65;
    
    //修改imageView的位置
    self.gifView.mj_y = 2.5;
    self.gifView.mj_h = 60;
    self.gifView.contentMode = UIViewContentModeScaleAspectFit;
}

@end
