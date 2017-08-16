//
//  BaseTableView.m
//  MVVM
//
//  Created by Haven on 2017/8/14.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView()<UIScrollViewDelegate,UITableViewDelegate>

@end

@implementation BaseTableView
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delegate = self;

 
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
@end
