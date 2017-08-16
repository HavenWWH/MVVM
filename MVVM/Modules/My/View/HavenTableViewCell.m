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

@interface HavenTableViewCell()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *dataArray;

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
//    [self setPageViewController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(selectSegment:) name:@"SelectSegment" object: nil];
}


#pragma mark ------  创建分页控制器  ------
- (void)setPageViewController
{
//     UIPageViewControllerOptionSpineLocationKey 翻页效果才有用, 书脊的位置
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey:@10};
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options: options];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource  =self;
    
    
    DTViewController *dtVc = [[DTViewController  alloc] init];
    WZViewController *wzVc = [[WZViewController  alloc] init];
    XHViewController *xhVc = [[XHViewController  alloc] init];
    self.dataArray = @[dtVc, wzVc, xhVc];
    
    [self.pageViewController setViewControllers:@[self.dataArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated: YES completion: nil];
    
    [self.contentView addSubview: self.pageViewController.view];
}

#pragma mark ------ UIPageViewControllerDelegate, UIPageViewControllerDataSource ------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.dataArray indexOfObject: viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    
    index -- ;
    
    return self.dataArray[index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.dataArray indexOfObject: viewController];
    if (index == self.dataArray.count - 1 || index == NSNotFound) {
        return nil;
    }
    index ++;
    return self.dataArray[index];
}
// 开始翻页
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    NSLog(@"pendingViewControllers%@", pendingViewControllers);
}

// 结束翻页
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    // 取出当前控制器在数组中的索引
    NSInteger index = [self.dataArray indexOfObject:self.pageViewController.viewControllers.firstObject];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pageViewScrollEnd" object: @(index)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)selectSegment: (NSNotification *)notic
{
    NSInteger index = [notic.object integerValue];
//    [self.pageViewController setViewControllers: @[self.dataArray[index]] direction:UIPageViewControllerNavigationDirectionForward animated: YES completion: nil];
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

@end
