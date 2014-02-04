//
//  ZBViewController.m
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioViewController.h"
#import <TDAudioPlayer/TDAudioPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "ZBAudioPlayerView.h"

@interface ZBAudioViewController () <ZBAudioPlayerViewDelegate>

@property (nonatomic, strong) AVAudioPlayer *backgroundMusicPlayer;
@property (nonatomic, weak) IBOutlet ZBAudioPlayerView *audioPlayerView;

@end

@implementation ZBAudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.audioPlayerView.artistNameLabel.text = self.monk.name;
    self.audioPlayerView.albumArtwork.image = self.monk.image;
    self.audioPlayerView.trackNameLabel.text = self.monk.currentTalk;
    
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.talkURL error:&error];
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
    
    
}

- (void)playOrPauseCurrentTrack
{
    if ([self.backgroundMusicPlayer isPlaying]) {
        [self.backgroundMusicPlayer pause];
    } else {
        [self.backgroundMusicPlayer play];
    }
    // title may become unsynced with playing state...
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
