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




@implementation TKGeneralTableViewCell

- (void)buildView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.leftGeneralItem = [TKGeneralItem new];
    self.rightGeneralItem = [TKGeneralItem new];
    
    //追加响应
    [self.leftGeneralItem addUIControlHandlerTarget:self action:@selector(generalItemDidTap:)];
    [self.leftGeneralItem.getDiscountButton addTarget:self action:@selector(generalItemDidTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightGeneralItem addUIControlHandlerTarget:self action:@selector(generalItemDidTap:)];
    [self.rightGeneralItem.getDiscountButton addTarget:self action:@selector(generalItemDidTap:) forControlEvents:UIControlEventTouchUpInside];
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


- (void)generalItemDidTap:(TKGeneralItem *)sender
{
    if (!self.messageInfo) {  return; }
    
    NSInteger row = self.indexPath.row;
    NSInteger currentIndex = row * 2 +(([sender isEqual:self.leftGeneralItem] || [sender isEqual:self.leftGeneralItem.getDiscountButton]) ? 0 : 1);
    
    //获得数据
//    id <TKGood> item = TKEnityCreateWithData(self.messageInfo[@"msg"][currentIndex]);
    
    //进行回调
    [self actionDidSelectCellAtIndex:row Info:@{TKConstDictionaryKeyPlatform:TKConstDictionaryValueKeyLocalWeb,TKConstDictionaryKeyCategoryInfo:self.messageInfo[@"msg"][currentIndex]}];
}


- (void)updateViewByData:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath cellDelegate:(id)delegate
{
    //获得当前的数据
    self.delegate = delegate;
    self.indexPath = indexPath;
    self.messageInfo = dataDict;
    
    NSArray <NSDictionary *> *datas = [[dataDict valueForKey:@"msg"] copy];
    
    //获得row
    NSInteger row = indexPath.row;
    NSInteger currentIndex = row * 2;
    
    NSInteger count = currentIndex + 2 > datas.count ? 1 : 2;
    
    // 隐藏right
    self.rightGeneralItem.hidden = (count == 1);
    
    //获得当前第一个item
    id <TKGood> good1 = TKEnityCreateWithData(datas[currentIndex]);
    [self.leftGeneralItem updateMessInfo:good1];
    
    if (count == 2) {
        
        id <TKGood> good2 = TKEnityCreateWithData(datas[currentIndex + 1]);
        [self.rightGeneralItem updateMessInfo:good2];
    }
}


- (CGFloat)prepareHeightByDict:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath
{
    return TKScale(312);
}

@end
