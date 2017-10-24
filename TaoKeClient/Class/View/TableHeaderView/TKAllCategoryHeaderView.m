//
//  TKAllCategoryHeaderView.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/24.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKAllCategoryHeaderView.h"
#import "TKCardCycleScrollView.h"
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
        scrollView;
    });
    
    
    [self addSubview:self.cycleView];
    [self buildLayouts];
}


- (void)buildLayouts
{
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.right.offset(0);
        make.height.mas_equalTo(TKScale(206));
        
    }];
}



- (void)updateCycleItems:(NSArray<NSDictionary<TKGood> *> *)items
{
    self.cycleView.items = items;
}

@end
