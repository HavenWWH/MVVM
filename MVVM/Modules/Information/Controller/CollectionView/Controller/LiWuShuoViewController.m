//
//  LiWuShuoViewController.m
//  MVVM
//
//  Created by Haven on 2017/8/24.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "LiWuShuoViewController.h"
#import "LWSCollectionViewCell.h"
#import "LiWuShuoViewModel.h"
#import "LWSTableView.h"
#import "LWSCollectionView.h"
#import "LJCollectionViewFlowLayout.h"


@interface LiWuShuoViewController ()

@property (weak, nonatomic) IBOutlet LWSTableView *leftTableView;

@property (weak, nonatomic) IBOutlet LWSCollectionView *rightCollectionView;

@property (weak, nonatomic) IBOutlet LJCollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) LiWuShuoViewModel *lwsViewModel;


@end

@implementation LiWuShuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"collection联动";
    self.lwsViewModel = [[LiWuShuoViewModel alloc] init];
    self.leftTableView.lwsViewModel = self.lwsViewModel;
    self.rightCollectionView.lwsViewModel = self.lwsViewModel;
    // collection初始化
    [self collectionInit];
}



#pragma mark ------ collection初始化 --------

- (void)collectionInit
{
    // 注册cell
    UINib *nib = [UINib nibWithNibName:[LWSCollectionViewCell registerName] bundle: nil];
    [self.rightCollectionView registerNib: nib forCellWithReuseIdentifier: cellId];
    
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.headerReferenceSize = CGSizeMake(KScreenWidth - 80, 44);
    // ios9 以后sectionHeader悬浮只要设置这个属性即可。  如果是iOS9之前需要自定义flowLayout, 如果实现了自定义layout, 则不需要实现此方法, 否则报错LJCollectionViewFlowLayout
//    if (CurrentSystemVersion >= 9.0) {
//        self.flowLayout.sectionHeadersPinToVisibleBounds = YES;
//    }

}
@end
