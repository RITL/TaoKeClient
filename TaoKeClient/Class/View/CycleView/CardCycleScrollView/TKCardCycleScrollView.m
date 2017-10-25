//
//  TKCardCycleScrollView.m
//  XiaoNongDingClient
//
//  Created by YueWen on 2017/10/13.
//  Copyright © 2017年 ryden. All rights reserved.
//

#import "TKCardCycleScrollView.h"
#import "TKCardCycleCollectionCell.h"
#import <Masonry.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import <UIImageView+WebCache.h>

static NSString *TKCardCycleScrollView_ID = @"TKCardCycleScrollView";

@interface TKCardCycleScrollView()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation TKCardCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupCardMainView];
    }
    
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupCardMainView];
}


- (void)setupCardMainView
{

    self.collectionView = ({
       
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = TKScale(10);
        flowLayout.minimumInteritemSpacing = TKScale(10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        mainView.contentInset = UIEdgeInsetsMake(0, TKScale(15), 0, 0);
        mainView.backgroundColor = [UIColor clearColor];
        mainView.pagingEnabled = YES;
        mainView.showsHorizontalScrollIndicator = NO;
        mainView.showsVerticalScrollIndicator = NO;
        [mainView registerClass:[TKCardCycleCollectionCell class] forCellWithReuseIdentifier:TKCardCycleScrollView_ID];
        mainView.dataSource = self;
        mainView.delegate = self;
        mainView.scrollsToTop = NO;
        
        if (@available(iOS 11,*)) {
            
            mainView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        mainView;
    });

    
    self.pageLabel = ({
       
        UIButton *button = [UIButton new];
        button.adjustsImageWhenHighlighted = false;
        button.adjustsImageWhenDisabled = false;
        button.userInteractionEnabled = false;
        
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"cycleView_card_pageBackground"] forState:UIControlStateNormal];
        
        button;
    });
    
    [self addSubview:self.collectionView];
    [self addSubview:self.pageLabel];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.right.offset(0);
        make.height.mas_equalTo(TKScale(215));
    }];
    
    
    [self.pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.offset(TKScale(-27));
        make.right.offset(TKScale(-20));
        make.height.mas_equalTo(TKScale(16)).priorityHigh();
    }];
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TKCardCycleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TKCardCycleScrollView_ID forIndexPath:indexPath];
    
    //获得item
    id <TKGood> item = self.items[indexPath.row];
    

    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.product_main_image] placeholderImage:nil];
    cell.titleLabel.text = item.product_name;
    cell.subTitleLabel.text = item.introduce;
    
    return cell;
}


#pragma mark - function


- (void)setCurrentPageIndex:(NSInteger)index total:(NSInteger)total
{
    if (total == 0 || total == 1) {
        
        self.pageLabel.hidden = true;
        return;
    }
    
    NSDictionary *indexAttributes = @{
                                      NSFontAttributeName : TKUtilityFont(@"PingFang-SC-Bold", TKScale(14.0)),
                                      NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    NSDictionary *signAttributes = @{NSFontAttributeName : TKUtilityFont(TKFontPingFangSC_Regular, TKScale(10.0)),
                                     NSForegroundColorAttributeName : TKColorFromRGB(0xe5e5e5)};
    
    NSDictionary *totalAttributes = @{
                                      NSFontAttributeName : TKUtilityFont(TKFontPingFangSC_Regular, TKScale(10.0)),
                                      NSForegroundColorAttributeName : TKColorFromRGB(0xe5e5e5)};
    
    
    NSMutableAttributedString *indexAtt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",@(index)] attributes:indexAttributes];
    
    NSMutableAttributedString *signAtt = [[NSMutableAttributedString alloc]initWithString:@"/" attributes:signAttributes];
    
    NSMutableAttributedString *totalAtt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",@(total)] attributes:totalAttributes];
    
    //属性字符串
    NSMutableAttributedString *resultAtt = [[NSMutableAttributedString alloc]initWithString:@""];
    
    //
    [resultAtt appendAttributedString:indexAtt];
    [resultAtt appendAttributedString:signAtt];
    [resultAtt appendAttributedString:totalAtt];
    
    [self.pageLabel setAttributedTitle:resultAtt.copy forState:UIControlStateNormal];
}


#pragma mark - set
- (void)setItems:(NSArray<id <TKGood>> *)items
{
    _items = items;

    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(TKScale(330), TKScale(215));
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if (!self.items.count) return; // 解决清除timer时偶尔会出现的问题
//    int itemIndex = ((int(*)(id,SEL))objc_msgSend)(self,sel_registerName("currentIndex"));
//    int indexOnPageControl = itemIndex % self.items.count;
    
//    [self setCurrentPageIndex:(indexOnPageControl + 1) total:self.items.count];
}

@end
