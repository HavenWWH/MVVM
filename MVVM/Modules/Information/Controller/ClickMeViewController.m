//
//  ClickMeViewController.m
//  MVVM
//
//  Created by Haven on 2017/8/2.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "ClickMeViewController.h"
#import "LiWuShuoViewController.h"
#import "MeiTuanViewController.h"

@interface ClickMeViewController ()

@end

@implementation ClickMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
- (IBAction)tableView {
    MeiTuanViewController *mtVc = [[MeiTuanViewController alloc] init];
    [self.navigationController pushViewController: mtVc animated:YES];
}
- (IBAction)collectionView {
    LiWuShuoViewController *lwsVc = [[LiWuShuoViewController alloc] init];
    [self.navigationController pushViewController: lwsVc animated: YES];
    
}
@end
