//
//  CellHeaderView.m
//  MVVM
//
//  Created by Haven on 2017/8/9.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "CellHeaderView.h"

@interface CellHeaderView ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation CellHeaderView
- (void)awakeFromNib
{
    [super awakeFromNib];
    NSDictionary *normalDict = @{NSForegroundColorAttributeName : [UIColor grayColor],
                           NSFontAttributeName : [UIFont systemFontOfSize: 15.0]};
    [self.segment setTitleTextAttributes: normalDict forState: UIControlStateNormal];
    
    NSDictionary *SelectDict = @{NSForegroundColorAttributeName : [UIColor grayColor],
                                 NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle],
                           NSFontAttributeName : [UIFont systemFontOfSize: 17.0]};
    [self.segment setTitleTextAttributes: SelectDict forState: UIControlStateSelected];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageViewChange:) name: @"pageViewScrollEnd" object: nil];
}

+ (instancetype)createCellHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed: @"CellHeaderView" owner: nil options: nil] lastObject];
}

- (IBAction)segmentClick:(UISegmentedControl *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName: @"SelectSegment" object:@(self.segment.selectedSegmentIndex)];
}

- (void)pageViewChange: (NSNotification *)notic
{
    self.segment.selectedSegmentIndex = [notic.object integerValue];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

@end
