//
//  AddShoppingCarTool.h
//  MVVM
//
//  Created by rzhy on 2017/8/30.
//  Copyright © 2017年 com.RuanZhiHongYi. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^completionBlock)();
@interface AddShoppingCarTool : NSObject
/**
 * 添加到购物车
 */
+ (void)addShoppingCarWithImage:(UIImage *)image startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint view: (UIView *)view completeBlock:(completionBlock)completionBlock;
@end
