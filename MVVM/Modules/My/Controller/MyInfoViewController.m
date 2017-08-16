//
//  MyInfoViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)myController {
    MyViewController *myVc = [[MyViewController alloc] init];
    [self.navigationController pushViewController: myVc animated: YES];

}



@end
