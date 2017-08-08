//
//  SpeechSynthesizerTool.m
//  DIDIAmbulancePub
//
//  Created by Haven on 2017/5/23.
//  Copyright © 2017年 Haven. All rights reserved.
//

#import "SpeechSynthesizerTool.h"
#import <AVFoundation/AVFoundation.h>

@interface SpeechSynthesizerTool()<AVSpeechSynthesizerDelegate>
@property (nonatomic, strong) AVSpeechSynthesizer *speechSyn;


@end

@implementation SpeechSynthesizerTool

static SpeechSynthesizerTool *SpeechTool = nil;

+ (instancetype)shareSpeechTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SpeechTool = [[SpeechSynthesizerTool alloc] init];
    });
    return SpeechTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 创建语音播报
        [self setupSpeechSynthesizer];
    }
    return self;
}

- (void)setupSpeechSynthesizer
{
    self.speechSyn = [[AVSpeechSynthesizer alloc] init];
    self.speechSyn.delegate = self;
   
}

- (void)setSpeakString: (NSString *)speakStr
{
    AVSpeechUtterance *speechUtt = [[AVSpeechUtterance alloc] initWithString:speakStr];
    AVSpeechSynthesisVoice *speechSynVoice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    speechUtt.voice = speechSynVoice;
    speechUtt.rate = 0.5;
    [self.speechSyn speakUtterance: speechUtt];
}


#pragma mark - AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    DLog(@"开始播放");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    DLog(@"暂停播放");
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    DLog(@"取消播放");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    DLog(@"结束播放");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance
{
    DLog(@"继续播放");
}
@end
