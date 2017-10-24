//
//  TKCardCycleCollectionCell.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/13.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKCardCycleCollectionCell.h"
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
    
    self.backgroundImageView = ({
       
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor yellowColor];
        imageView.layer.shadowColor = UIColor.groupTableViewBackgroundColor.CGColor;
        
        imageView;
    });
    
    self.imageView = ({
       
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.backgroundColor = [UIColor whiteColor];
//        imageView.image = [UIImage imageNamed:@"cycleView_card_background"];
        imageView.clipsToBounds = true;
        imageView.layer.cornerRadius = TKScale(8);
        
        imageView;
    });
    
    
    self.titleLabel = ({
        
        UILabel *label = [UILabel new];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = TKUtilityFont(@"PingFang-SC-Medium", TKScale(15));
        
        label;
    });
    
    
    self.subTitleLabel = ({
        
        UILabel *label = [UILabel new];
        label.textColor = UIColor.whiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = TKUtilityFont(@"PingFang-SC-Regular", TKScale(12));
        label.numberOfLines = 2;
        
        label;
    });
    
    
    [self.contentView addSubview:self.backgroundImageView];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];
    
    //进行布局
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(13));
        make.left.offset(TKScale(0));
        make.right.offset(TKScale(-0));
        make.bottom.offset(TKScale(0));
        
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(10));
        make.right.offset(TKScale(-10));
        make.left.offset(TKScale(10));
        make.bottom.offset(TKScale(-15));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.offset(TKScale(126));
        make.left.offset(TKTestScale(38));
        make.right.offset(TKTestScale(-38));
        make.centerX.offset(0);
    }];
    
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.titleLabel.mas_bottom).offset(TKTestScale(6));
        make.left.offset(TKTestScale(46));
        make.right.offset(TKTestScale(-46));
        make.centerX.offset(0);
        
    }];
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
