//
//  MBProgressHUD+Haven.m
//  MVVM
//
//  Created by Haven on 2017/7/14.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import "MBProgressHUD+Haven.h"
#import "NSError+MHExtension.h"

@implementation MBProgressHUD (Haven)
// 提示信息
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithTip: (NSString *)tip
{
    return [self createMBProgressHUDWithTip: tip isAutoHide: YES addToView: nil];
}

// 提示错误
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithError: (NSError *)error
{
    return [self createMBProgressHUDWithTip: [NSError mh_tipsFromError: error] isAutoHide: YES addToView: nil];
}

// 进度和文字
+ (MBProgressHUD *)MBHUD_showMBProgressHUDWithProStr: (NSString *)proStr
{
    return [self createMBProgressHUDWithTip: proStr isAutoHide: NO addToView: nil];
}
// 进度
+ (MBProgressHUD *)MBHUD_show
{
    return [self createMBProgressHUDWithTip: nil isAutoHide: NO addToView: nil];
}

// 隐藏
+ (void)MBHUD_hide
{
    [self hideHUDForView:[self willShowingToViewWithSourceView: nil] animated: YES];
}

#pragma mark - 辅助方法
/// 获取将要显示的view
+ (UIView *)willShowingToViewWithSourceView:(UIView *)sourceView
{
    if (sourceView) return sourceView;
    
    sourceView =  [[UIApplication sharedApplication].delegate window];
    if (!sourceView) sourceView = [[[UIApplication sharedApplication] windows] lastObject];
    
    return sourceView;
}

+ (MBProgressHUD *)createMBProgressHUDWithTip: (NSString *)tipStr isAutoHide: (BOOL)isHide addToView: (UIView *)view
{
    /** 
     * isHide为YES表示显示文字, 自动隐藏,  否则表示进度
     */
    view = [self willShowingToViewWithSourceView: view];
    // 隐藏之前的
    [self hideHUDForView: view animated: YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: view animated: YES];
    hud.mode = isHide ? MBProgressHUDModeText : MBProgressHUDModeAnnularDeterminate;
    hud.label.text = tipStr;
    hud.label.textColor = [UIColor blackColor];
    hud.label.font = [UIFont systemFontOfSize: 17.0f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.layer.cornerRadius = 5;
    hud.bezelView.layer.masksToBounds = YES;
//    hud.center = view.center;
//    hud.minSize = CGSizeMake(100, 100);
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.removeFromSuperViewOnHide = YES;
    if (isHide) [hud hideAnimated: YES afterDelay: 1.0f];
    return  hud;
    
    
}
@end
