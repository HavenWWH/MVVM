//
//  PostViewController.m
//  MVVM
//
//  Created by Haven on 2017/7/17.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "PostViewController.h"
#import "WindowView.h"

@interface PostViewController ()

@property (weak, nonatomic) IBOutlet UIButton *hideBtn;
@property (nonatomic, strong) WindowView *windowView;
@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewRadius(self.hideBtn, 22);
    self.windowView = [[WindowView alloc] initWithWindowView: CGSizeMake(60, 60) withImage:@"redPack.png" withClickBlock:^{
        NSLog(@"click");
    }];
}
- (IBAction)hideController {
    [self.windowView windowButtonHide];
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
