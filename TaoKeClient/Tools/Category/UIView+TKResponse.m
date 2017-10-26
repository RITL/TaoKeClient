//
//  UIView+TKResponse.m
//  TKPhotoDemo
//
//  Created by YueWen on 2016/12/29.
//  Copyright © 2017年 YueWen. All rights reserved.
//

#import "UIView+TKResponse.h"
#import <Masonry.h>
#import <objc/runtime.h>

@implementation UIControl (TKBlockButton)


-(void)controlEvents:(UIControlEvents)controlEvents handle:(void (^)(__kindof UIControl * _Nonnull))eventHandleBlock
{
    if (!eventHandleBlock)
    {
        return;
    }
    
    //将block缓存
    objc_setAssociatedObject(self, &@selector(controlEvents:handle:), eventHandleBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    //添加目标动作回调
    [self addTarget:self action:@selector(actionFunction) forControlEvents:controlEvents];
}


- (void)actionFunction
{
    //获得block
    void(^block)(UIControl *)  = (void(^)(UIControl *))objc_getAssociatedObject(self, &@selector(controlEvents:handle:));
    
    if (block) {
        
        block(self);//执行方法
    }
}



@end


@implementation UIGestureRecognizer (TKBlockRecognizer)

-(void)gestureRecognizerHandle:(void (^)(UIGestureRecognizer * _Nonnull))eventHandleBlock
{
    if ((!eventHandleBlock))
    {
        return;
    }
    
    //将block缓存
    objc_setAssociatedObject(self, &@selector(gestureRecognizerHandle:), eventHandleBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    //添加目标动作回调
    [self addTarget:self action:@selector(gestureActionFunction:)];
}



- (void)gestureActionFunction:(UIGestureRecognizer *)sender
{
    //获得block
    void(^block)(UIGestureRecognizer *)  = (void(^)(UIGestureRecognizer *))objc_getAssociatedObject(self, &@selector(gestureRecognizerHandle:));
    
    //执行block
    block(self);
}


@end



@implementation UIView (TKBlockRecognizer)


-(UITapGestureRecognizer *)addTapGestureRecognizerNumberOfTap:(NSUInteger)numberOfTap
                                                      Handler:(void (^)(UIView * _Nonnull))actionHandler
{
    self.userInteractionEnabled = true;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]init];
    
    tapGestureRecognizer.numberOfTapsRequired = numberOfTap;
    
    __weak typeof(self) weakSelf = self;
    
    //进行响应
    [tapGestureRecognizer gestureRecognizerHandle:^(UIGestureRecognizer * _Nonnull sender) {
       
        actionHandler(weakSelf);
        
    }];
    
    [self addGestureRecognizer:tapGestureRecognizer];
    
    return tapGestureRecognizer;
}




-(UIControl *)addUIControlHandler:(void (^)(UIView * _Nonnull))actionHandler
{
    UIControl *control = [UIControl new];
    control.backgroundColor = [UIColor clearColor];
    
    [self addSubview:control];
    
    //放到最底下
    [self insertSubview:control atIndex:0];
    
    if (!self.userInteractionEnabled) {
        self.userInteractionEnabled = true;
    }
    
     __weak typeof(self) weakSelf = self;
    
    //进行布局
    [control controlEvents:UIControlEventTouchUpInside handle:^(UIControl * _Nonnull sender) {
        
        actionHandler(weakSelf);
        
    }];
    
    [control mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.right.and.bottom.offset(0);
        
    }];
    
    
    return control;
}



-(UIControl *)addUIControlHandlerTarget:(__weak id)target action:(SEL)action
{
     __weak typeof(self) weakSelf = self;
    
    return [self addUIControlHandler:^(UIView * _Nonnull view) {
       
        
        [target performSelector:action withObject:weakSelf afterDelay:0];
        
    }];
}

@end
