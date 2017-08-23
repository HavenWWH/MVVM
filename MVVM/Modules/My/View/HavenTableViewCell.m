//
//  HavenTableViewCell.m
//  MVVM
//
//  Created by Haven on 2017/8/10.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HavenTableViewCell.h"
#import "DTViewController.h"
#import "WZViewController.h"
#import "XHViewController.h"
#import "BaseTableView.h"


#define segmentCount 3

#define contentHeight KScreenHeight - 64 - 44

@interface HavenTableViewCell()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation HavenTableViewCell
+ (instancetype)createHavenTableViewCellWithTableView: (UITableView *)tableView
{
    static NSString *ID = @"cell";
    HavenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HavenTableViewCell" owner: nil options:nil] lastObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(selectSegment:) name:@"SelectSegment" object: nil];
    
    [self createScrollView];
}

#pragma mark --- scrollView ---
- (void)createScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, contentHeight)];
    self.scrollView.contentSize = CGSizeMake(KScreenWidth * segmentCount, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview: self.scrollView];
    for (int i = 0; i < segmentCount; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame: CGRectMake(i * KScreenWidth, 0, KScreenWidth, contentHeight) style:UITableViewStylePlain];
        tableView.tag = 10000 + i;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.scrollView addSubview: tableView];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)selectSegment: (NSNotification *)notic
{
    NSInteger index = [notic.object integerValue];
    self.scrollView.contentOffset = CGPointMake(index * KScreenWidth, 0);
}

- (void)setCanScroll:(BOOL)canScroll
{
    _canScroll = canScroll;
 
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark ------ UITableViewDelegate, UITableViewDelegate ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ce";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (tableView.tag == 10000) {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld wu", indexPath.row];
    }
    if (tableView.tag == 10001) {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld wen", indexPath.row];
    }
    if (tableView.tag == 10002) {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld hai", indexPath.row];
    }
    return cell;
}

#pragma mark ------    UIScrollViewDelegate   ------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"offset%@", NSStringFromCGPoint(scrollView.contentOffset));
    if (!self.canScroll && scrollView.contentOffset.x == 0) {
        [scrollView setContentOffset:CGPointZero];
    }
    CGFloat offY = scrollView.contentOffset.y;
    
    // 计算scrollView当前页数
    NSInteger index = floor((self.scrollView.contentOffset.x - KScreenWidth / 2) / KScreenWidth) + 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pageViewScrollEnd" object: @(index)];
    
    
    if (offY < 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollLeaveTop" object:nil];
        self.canScroll = NO;
        scrollView.contentOffset = CGPointZero;
    }

    
}



@end
