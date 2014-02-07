//
//  ZBSharedAudioPlayer.h
//  Monks
//
//  Created by Zuri Biringer on 2/6/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ZBSharedAudioPlayer : NSObject

@property (nonatomic, strong) AVAudioPlayer *player;

+(ZBSharedAudioPlayer *)sharedAudioPlayer;

@end
