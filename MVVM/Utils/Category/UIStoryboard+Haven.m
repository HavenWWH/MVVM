//
//  UIStoryboard+Haven.m
//  DIDIAmbulancePub
//
//  Created by Haven on 2016/12/19.
//  Copyright © 2016年 Haven. All rights reserved.
//

#import "UIStoryboard+Haven.h"

@implementation UIStoryboard (Haven)
+(void)showInitialVCWithName:(NSString *)name{
    [UIApplication sharedApplication].keyWindow.rootViewController = [[[self alloc] initWithStoryboardName: name]instantiateInitialViewController];
}

+(id)initialVCWithName:(NSString *)name{
    return [[[self alloc] initWithStoryboardName: name] instantiateInitialViewController];
}

+ (id)initialVCWithName: (NSString *)name identifier: (NSString *)storyboardId
{
    return [[[self alloc] initWithStoryboardName: name] instantiateViewControllerWithIdentifier: storyboardId];
}

- (instancetype)initWithStoryboardName: (NSString *)name
{
    return [UIStoryboard storyboardWithName: name bundle:[NSBundle mainBundle]];
}

@end
