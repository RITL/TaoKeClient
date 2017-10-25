//
//  TKNormalTitleHeaderView.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKNormalTitleHeaderView.h"
#import <Masonry.h>

@implementation TKNormalTitleHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self buildViews];
    }
    
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self buildViews];
}


- (void)buildViews
{
    self.titleLabel = ({
        
        UILabel *label = [UILabel new];
        
        label.font = TKUtilityFont(@"PingFangSC-Medium", TKScale(16));
        label.textColor = TKColorFromRGB(0x666666);
        
        label;
    });
    
    [self addSubview:self.titleLabel];
    [self buildLayouts];
}


- (void)buildLayouts
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.offset(0);
    }];
}



@end
