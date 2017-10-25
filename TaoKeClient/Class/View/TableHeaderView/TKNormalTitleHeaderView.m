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


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
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
        
        label.font = TKUtilityFont(TKFontPingFangSC_Medium, TKScale(16));
        label.textColor = TKGrayColor;
        label.backgroundColor = UIColor.whiteColor;
        
        label;
    });
    
    [self addSubview:self.titleLabel];
    [self buildLayouts];
}



- (void)buildLayouts
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.offset(0);
        make.left.offset(TKScale(10));
        make.right.offset(TKScale(-10));
    }];
}



@end
