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
@property (nonatomic, strong) NSTimer *timer;

- (void)playOrPauseCurrentTrack;

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
    [self playOrPauseCurrentTrack];
    
    
}

- (void)playOrPauseCurrentTrack
{
    if ([self.backgroundMusicPlayer isPlaying]) {
        [self.backgroundMusicPlayer pause];
        [self stopTimer];
    } else {
        [self.backgroundMusicPlayer play];
        [self startTimer];
    }
    // title may become unsynced with playing state...
    
}
- (void)skipAheadFifteenSeconds
{
    NSTimeInterval time = [self.backgroundMusicPlayer currentTime];
    time+=SKIP_TIME;
    if (time > self.backgroundMusicPlayer.duration) {
        //nothing to do
    } else {
        [self.backgroundMusicPlayer setCurrentTime:time];
    }
    
}

- (void)goBackFifteenSeconds
{
    NSTimeInterval time = [self.backgroundMusicPlayer currentTime];
    time-=SKIP_TIME;
    if (time < 0) {
        //nothing to do
    } else {
        [self.backgroundMusicPlayer setCurrentTime:time];
    }
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(didPlayForSecond) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

- (void)didPlayForSecond
{
    NSString *currentTime = [NSString stringWithFormat:@"%.0f", self.backgroundMusicPlayer.currentTime];
    NSString *remainingTime = [NSString stringWithFormat:@"%.0f", self.backgroundMusicPlayer.duration - self.backgroundMusicPlayer.currentTime];
    [self.audioPlayerView updateLabelsForTime:currentTime remainingTime:remainingTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
