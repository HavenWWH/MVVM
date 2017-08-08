//
//  HavenScrollView.m
//  HavenScrollView
//
//  Created by Haven on 2016/11/2.
//  Copyright © 2016年 com.RuanZhiHongYi. All rights reserved.
//  上下轮播图

#import "HavenScrollView.h"
#import "UIView+extension.h"


@interface HavenScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

// 拼接后的数组
@property (nonatomic, strong) NSMutableArray *newtitleArray;

// 定时器
@property (nonatomic, strong) NSTimer *timer;
@end



@implementation HavenScrollView
// 加载scrollView
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView =[[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        [_scrollView setContentOffset:CGPointMake(0 , self.scrollView.height) animated:YES];
        
    }
    return _scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.scrollView.delegate = self;
        
        [self addTimer];
    }
    return self;
}

// 定时器
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 3 target:self selector:@selector(nextLable) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 切换lable
- (void)nextLable
{
    CGPoint point = self.scrollView.contentOffset;
    point.y = point.y + self.scrollView.size.height;
    [self.scrollView setContentOffset: point animated:YES];
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    if (titleArray == nil) {
        [self removeTimer];
        return;
    }
    
    if (titleArray.count == 1) {
        [self removeTimer];
    }
    id object = [self.titleArray lastObject];
    
    self.newtitleArray = [NSMutableArray array];
    [self.newtitleArray addObject: object];
    [self.newtitleArray addObjectsFromArray: self.titleArray];
    
    CGFloat lableH = self.scrollView.size.height;
    CGFloat lableW = self.scrollView.size.width;
    
    for(int i = 0; i < self.titleArray.count; i++)
    {
        
        UILabel *lable= [[UILabel alloc] initWithFrame:CGRectMake(0, lableH * i, lableW, lableH)];
        
        lable.tag = i + 100;
        
        UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLable:)];
        lable.userInteractionEnabled = YES;
        [lable addGestureRecognizer: tapGestureRecognize];
        
        lable.text = self.newtitleArray[i];
        
        lable.textAlignment = NSTextAlignmentCenter;
        
        
        [self.scrollView addSubview: lable];

    }
}

// 设置颜色
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    for (UILabel *lable in self.scrollView.subviews) {
        lable.textColor = titleColor;
    }
}
// 设置字体大小
- (void)setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    for (UILabel *lable in self.scrollView.subviews) {
        lable.font =[UIFont systemFontOfSize: _fontSize];
    }
}
// 设置背景颜色
- (void)setBgColor:(UIColor *)BgColor
{
    _BgColor = BgColor;
    self.scrollView.backgroundColor = BgColor;
}
// lable点击
- (void)clickLable: (UITapGestureRecognizer *)tapGestureRecognizer
{
    NSInteger index = tapGestureRecognizer.view.tag - 1;
    if (self.clickLableBlock) {
        if (index < 100) {
            
            index = 100 + (self.titleArray.count - 1);
            
        }
        self.clickLableBlock(index - 100, self.titleArray[index - 100]);
    }
}

- (void)clickLableWithBlock:(clickLableBlock)clickBlock
{
    self.clickLableBlock = clickBlock;
}

// 移除定时器
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scrollView.contentOffset.y == self.scrollView.height * self.titleArray.count) {
        
        [self.scrollView setContentOffset:CGPointZero animated: NO];
    }
}

@end
