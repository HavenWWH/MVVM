//
//  HavenTableViewCell.h
//  MVVM
//
//  Created by Haven on 2017/8/10.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HavenTableViewCell : UITableViewCell

+ (instancetype)createHavenTableViewCellWithTableView: (UITableView *)tableView;
@property (nonatomic, assign) BOOL canScroll;
@end
