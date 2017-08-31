//
//  OvalProgress.h
//  MVVM
//
//  Created by rzhy on 2017/8/31.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OvalProgress : UIView

- (instancetype)initOvalProgressWith: (CGFloat)progressValue;

- (void)setProgressValue: (CGFloat)progressValue;

@end
