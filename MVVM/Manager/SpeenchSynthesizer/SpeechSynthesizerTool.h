//
//  SpeechSynthesizerTool.h
//  DIDIAmbulancePub
//
//  Created by Haven on 2017/5/23.
//  Copyright © 2017年 Haven. All rights reserved.
//  语音播报工具类

#import <Foundation/Foundation.h>

@interface SpeechSynthesizerTool : NSObject

+ (instancetype)shareSpeechTool;

- (void)setSpeakString: (NSString *)speakStr;


@end
