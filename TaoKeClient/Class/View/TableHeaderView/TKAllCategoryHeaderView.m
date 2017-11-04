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

@interface TKAllCategoryHeaderView ()<LLSegmentBarDelegate,TKCardCycleScrollDelegate>


@end

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
    
    self.cycleView.delegate = self;
    
    self.segmentBar = ({
       
        LLSegmentBar *segmentBar = [LLSegmentBar new];
        segmentBar.tk_map_indicatorView.hidden = true;
        segmentBar.buttonAddctionWidth = TKScale(30);
        segmentBar.borderMargin = TKScale(10);
        segmentBar.buttonsMargin = TKScale(15);
        segmentBar.delegate = self;
        segmentBar.repetPrevent = false;//不进行连点阻隔
        
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



#pragma mark - LLSegmentBarDelegate

- (void)segmentBar:(LLSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    //获得category对象
    id <TKCategoryTitle> title = self.segmentBar.titleItems[toIndex];
    
    //进行回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(tk_allCategoryHeaderView:type:info:)]) {
        
        //进行回调
        [self.delegate tk_allCategoryHeaderView:self type:TKAllCategoryHeaderViewActionTypeSegment info:@{TKConstDictionaryKeyPlatform : TKConstDictionaryValueKeyCategory,TKConstDictionaryKeyCategoryTitle : title}];
    }
}


#pragma mark - TKCardCycleScrollDelegate

- (void)tk_cardCycleScrollView:(TKCardCycleScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index
{
    //获得good对象
    id <TKGood> good = scrollView.items[index];
    
    //进行回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(tk_allCategoryHeaderView:type:info:)]) {
        
        //进行回调
        [self.delegate tk_allCategoryHeaderView:self type:TKAllCategoryHeaderViewActionTypeCycle info:@{TKConstDictionaryKeyPlatform : TKConstDictionaryValueKeyLocalWeb,TKConstDictionaryKeyCategoryInfo : good.proxy_real_enity}];
    }
}



@end
