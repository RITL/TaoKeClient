//
//  TKAllCategoryHeaderView.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKAllCategoryHeaderView.h"
#import "TKCardCycleScrollView.h"
#import "LLSegmentBar+TKExtension.h"
#import <Masonry.h>

@implementation TKAllCategoryHeaderView

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
    self.cycleView = ({
        
        TKCardCycleScrollView *scrollView = [TKCardCycleScrollView new];
        scrollView.backgroundColor = [UIColor whiteColor];
        scrollView;
    });
    
    self.segmentBar = ({
       
        LLSegmentBar *segmentBar = [LLSegmentBar new];
        segmentBar.tk_map_indicatorView.hidden = true;
        segmentBar.buttonAddctionWidth = TKScale(30);
        segmentBar.borderMargin = TKScale(10);
        segmentBar.buttonsMargin = TKScale(15);
        
        //设置属性
        [segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
           
            config
            .itemNormalColor(UIColor.whiteColor)
            .itemSelectColor(UIColor.whiteColor)
            .itemBackColor(TKAllCategorySegmentBackgroundColor)
            .itemRadius(TKScale(30 / 2))
            .segmentBarBackColor(UIColor.whiteColor);
        }];
        
        segmentBar;
    });
    
    
    [self addSubview:self.cycleView];
    [self addSubview:self.segmentBar];
    [self buildLayouts];
}


- (void)buildLayouts
{
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(5));
        make.left.right.offset(0);
        make.height.mas_equalTo(TKScale(220));
        
    }];
    
    [self.segmentBar mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.offset(0);
        make.top.equalTo(self.cycleView.mas_bottom).offset(TKScale(2));
        make.bottom.offset(0);
    }];
}



- (void)updateCycleItems:(NSArray<id <TKGood>> *)items
{
    self.cycleView.items = items;
}


- (void)updateSegmentItems:(NSArray<id<TKCategoryTitle>> *)titles
{
    self.segmentBar.titleItems = titles;
}

@end
