//
//  ZBViewController.h
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBMonk.h"
#import <AVFoundation/AVFoundation.h>

@interface ZBAudioViewController : UIViewController

@property (nonatomic, strong) AVAudioPlayer *backgroundMusicPlayer;
@property (nonatomic, weak) NSURL *talkURL;
@property (nonatomic, weak) ZBMonk *monk;

@end
