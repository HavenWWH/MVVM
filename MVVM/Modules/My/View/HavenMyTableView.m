//
//  HavenMyTableView.m
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "HavenMyTableView.h"
#import "CellHeaderView.h"
#import "HavenTableViewCell.h"
#import "HavenHeaderView.h"


@interface HavenMyTableView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) HavenHeaderView *headerView;
@end

@implementation HavenMyTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.delegate = self;
    self.dataSource = self;
    self.headerView = [HavenHeaderView createHeaderView];
    self.headerView.size = CGSizeMake(KScreenWidth, HeaderViewHeight - CustomNavHeight);
    [self addSubview: self.headerView];
    
}


#pragma mark ------  <UITableViewDelegate, UITableViewDataSource> ------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        return cell;
    }else{
        HavenTableViewCell *customCell = [HavenTableViewCell createHavenTableViewCellWithTableView: tableView];
        return customCell;
    }
    

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        CellHeaderView *cellHeaderView = [CellHeaderView createCellHeaderView];
        return cellHeaderView;
    }return [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 44;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 200;
    }else{
        return KScreenHeight - CustomNavHeight - HeaderViewHeight;
    }
}




-(void)setViewModel:(MyViewControllerViewModel *)viewModel
{
    _viewModel = viewModel;
}


#pragma mark ------   UIScrollViewDelegate  ------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetY = scrollView.contentOffset.y;
    CGFloat originY = 0;
    DLog(@"scrollVy:%f",  scrollView.contentOffset.y);
    if (offSetY > HeaderViewHeight - CustomNavHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(CustomNavHeight, 0, 0, 0);
    }
    if (offSetY < 0) {
        originY = offSetY;
        self.headerView.frame = CGRectMake(0, originY, KScreenWidth, HeaderViewHeight-originY);
    }
    
    


    
}


@end
