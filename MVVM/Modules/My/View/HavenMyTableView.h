//
//  HavenMyTableView.h
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewControllerViewModel.h"

#define CustomNavHeight 64

#define HeaderViewHeight 200

@interface HavenMyTableView : UITableView
@property (nonatomic, strong) MyViewControllerViewModel  *viewModel;
@property (nonatomic, assign) BOOL canScroll;
@end
