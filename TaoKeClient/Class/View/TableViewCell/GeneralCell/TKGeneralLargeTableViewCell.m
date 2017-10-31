//
//  TKGeneralLargeTableViewCell.m
//  TaoKeClient
//
//  Created by YueWen on 2017/10/27.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "TKGeneralLargeTableViewCell.h"
#import "UIView+TKExtension.h"
#import <Masonry.h>

@implementation TKGeneralLargeTableViewCell


- (void)buildView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.item = [TKGeneralLargeItem new];
    
    [self.item addUIControlHandlerTarget:self action:@selector(generalItemDidTap:)];
}


- (void)addSubviews
{
    [self.contentView addSubview:self.item];
}

- (void)buildLayouts
{
    [self.item mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.offset(TKScale(5));
        make.bottom.right.offset(TKScale(-5));
    }];
}


- (void)generalItemDidTap:(TKGeneralLargeItem *)sender
{
    if (!self.messageInfo) {  return; }
    
    //获得数据
//    id <TKGood> item = TKEnityCreateWithData(self.messageInfo[@"msg"][self.indexPath.row]);
    
    //进行回调
    [self actionDidSelectCellAtIndex:self.indexPath.row Info:@{TKConstDictionaryKeyPlatform:TKConstDictionaryValueKeyLocalWeb,TKConstDictionaryKeyCategoryInfo:self.messageInfo[@"msg"][self.indexPath.row]}];
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
    NSInteger currentIndex = row;


    //获得当前第一个item
    id <TKGood> good = TKEnityCreateWithData(datas[currentIndex]);
    [self.item updateMessInfo:good];

}


- (CGFloat)prepareHeightByDict:(NSDictionary *)dataDict indexPath:(NSIndexPath *)indexPath
{
    return TKScale(500);
}

@end
