//
//  DTViewController.m
//  MVVM
//
//  Created by Haven on 2017/8/11.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "DTViewController.h"
#import "BaseTableView.h"

@interface DTViewController ()<UITabBarDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet BaseTableView *tableView;

@end

@implementation DTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-wuwenhai", (long)indexPath.row];
    return cell;
}




@end
