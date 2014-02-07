//
//  ZBSharedAudioPlayer.m
//  Monks
//
//  Created by Zuri Biringer on 2/6/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBSharedAudioPlayer.h"

@implementation ZBSharedAudioPlayer

+(ZBSharedAudioPlayer *)sharedAudioPlayer {
    static dispatch_once_t pred;
    static ZBSharedAudioPlayer *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[ZBSharedAudioPlayer alloc] init];
        shared.player = [AVAudioPlayer new];
    });
    return shared;
}

@end
