//
//  TKGeneralTableViewCell.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/25.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKGeneralTableViewCell.h"
#import "UIView+TKExtension.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>

@interface TKGeneralItem ()

@property (nonatomic, assign, getter=isAddShadowLayer)BOOL addShadowLayer;

@end

@implementation TKGeneralItem

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
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.1;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    
    
    self.imageView = ({
       
        UIImageView *imageview = [UIImageView new];
        imageview.contentMode = UIViewContentModeScaleAspectFill;
        imageview.backgroundColor = UIColor.redColor;
        
        imageview;
    });
    
    
    self.titleLabel = ({
       
        UILabel *label = [UILabel new];
        label.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(16));
        label.numberOfLines = 2;
        label.text = @"澳康达红烧鸡块大厦监控的很快就皆都可打开就等哈监控的哈开始简单哈框架等哈监控的很快就按上";
        label.textColor = TKGeneralTitleColor;
        
        label;
    });
    
    
    self.priceLabel = ({
        
        UILabel *label = [UILabel new];
        label.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(12));
        label.text = @"￥34";
        label.textColor = TKGrayColor;
        
        label;
    });
    
    
    self.discountLabel = ({
        
        UILabel *label = [UILabel new];
        label.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(13));
        label.text = @"10元优惠券";
        label.textColor = TKThemeColor;
        
        label;
    });
    
    
    self.discountNumberLabel = ({
        
        UILabel *label = [UILabel new];
        label.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(13));
        label.text = @"(987元)";
        label.textColor = TKThemeColor;
        
        label;
    });
    
    
    self.getDiscountButton = ({
       
        UIButton *button = [UIButton new];
        
        button.adjustsImageWhenHighlighted = false;
        button.backgroundColor = TKThemeColor;
        button.titleLabel.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(13));
        [button setTitle:@"立即领券" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        
        button;
    });
    
    
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.discountLabel];
    [self addSubview:self.discountNumberLabel];
    [self addSubview:self.getDiscountButton];
    
    [self buildLayouts];
}



/// 创建约束
- (void)buildLayouts
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(10));
        make.left.offset(TKScale(10));
        make.right.offset(TKScale(-10));
        make.height.equalTo(self.imageView.mas_width);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.imageView);
        make.right.equalTo(self.imageView);
        make.top.equalTo(self.imageView.mas_bottom).offset(TKScale(3));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(TKScale(3));
        make.right.equalTo(self.titleLabel);
    }];
    
    [self.discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.priceLabel);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(TKScale(3));
        
    }];
    
    [self.discountNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.priceLabel);
        make.centerY.equalTo(self.discountLabel);
    }];
    
    [self.getDiscountButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.imageView);
        make.right.equalTo(self.imageView);
        make.top.equalTo(self.discountNumberLabel.mas_bottom).offset(TKScale(10));
        make.height.mas_equalTo(TKScale(25));
    }];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.isAddShadowLayer) {
        
        /// 追加阴影
        [self addShadowLayerAllaroundViewPadding:TKScale(1)];
        self.addShadowLayer = true;
    }
}


- (void)updateMessInfo:(id<TKGood>)good
{
    if (!good) { return; }
    
    //seting
    [self.imageView sd_setImageWithURL:good.product_main_image.tk_url placeholderImage:nil];
    self.titleLabel.text = good.product_name;

}

@end




@implementation TKGeneralTableViewCell

- (void)buildView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.leftGeneralItem = [TKGeneralItem new];
    self.rightGeneralItem = [TKGeneralItem new];
}


- (void)addSubviews
{
    [self.contentView addSubview:self.leftGeneralItem];
    [self.contentView addSubview:self.rightGeneralItem];
}


- (void)buildLayouts
{
    [self.leftGeneralItem mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(5));
        make.bottom.offset(TKScale(-5));
        make.left.offset(TKScale(5));
        make.right.equalTo(self.rightGeneralItem.mas_left).offset(TKScale(-10));
        make.width.equalTo(self.rightGeneralItem.mas_width);
    }];
    
    [self.rightGeneralItem mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(5));
        make.bottom.offset(TKScale(-5));
        make.right.offset(TKScale(-5));
        make.width.equalTo(self.leftGeneralItem.mas_width);
    }];
}


- (void)updateViewByData:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath cellDelegate:(id)delegate
{
    //获得当前的数据
    
}


- (CGFloat)prepareHeightByDict:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath
{
    return TKScale(312);
}

@end
