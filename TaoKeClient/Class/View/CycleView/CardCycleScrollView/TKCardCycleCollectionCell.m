//
//  TKCardCycleCollectionCell.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/13.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKCardCycleCollectionCell.h"
#import "CAGradientLayer+TKGradientLayer.h"
#import <Masonry.h>

@implementation TKCardCycleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpSubviews];
    }
    
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpSubviews];
}


- (void)setUpSubviews
{
    self.contentView.backgroundColor = [UIColor whiteColor];

    self.imageView = ({
       
        UIImageView *imageView = [UIImageView new];
        
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.clipsToBounds = true;
        imageView.layer.cornerRadius = TKScale(8);
        
        imageView;
    });
    
    
    self.shaowView = ({
       
        UIView *view = [UIView new];
        
//        view.backgroundColor = [UIColor.whiteColor];
        
        CAGradientLayer *shadowLayer = [CAGradientLayer tk_GradientLayer:CGRectZero];
        //设置位置属性
        shadowLayer.cornerRadius = TKScale(8);
        shadowLayer.startPoint = CGPointMake(0.5, 0);
        shadowLayer.endPoint = CGPointMake(0.5, 1);
        [view.layer insertSublayer:shadowLayer atIndex:0];
        
        view;
    });
    
    
    self.titleLabel = ({
        
        UILabel *label = [UILabel new];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = TKUtilityFont(TKFontPingFangSC_Medium, TKScale(16));
        
        label;
    });
    
    
    self.subTitleLabel = ({
        
        UILabel *label = [UILabel new];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = TKUtilityFont(TKFontPingFangSC_Regular, TKScale(13));
        label.numberOfLines = 2;
        
        label;
    });
    
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.shaowView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];
    
    //进行布局
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.offset(0);
//        make.top.offset(TKScale(0));
//        make.right.offset(TKScale(-0));
//        make.left.offset(TKScale(0));
//        make.bottom.offset(TKScale(0));
    }];
    
    
    [self.shaowView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.left.and.right.offset(0);
        make.top.equalTo(self.contentView.mas_centerY).offset(0);
        
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.offset(TKScale(140));
        make.left.offset(TKScale(26));
        make.right.offset(TKScale(-26));
        make.centerX.offset(0);
    }];


    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.titleLabel.mas_bottom).offset(TKScale(6));
        make.left.offset(TKScale(42));
        make.right.offset(TKScale(-42));
        make.centerX.offset(0);

    }];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置阴影
    self.shaowView.layer.sublayers.firstObject.frame = CGRectMake(0, 0, self.imageView.tk_width, self.imageView.tk_height / 2.0);
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
