//
//  ZBViewController.m
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioViewController.h"
#import <TDAudioPlayer/TDAudioPlayer.h>
#import "ZBAudioPlayerView.h"

@interface ZBAudioViewController () <ZBAudioPlayerViewDelegate>


@property (nonatomic, weak) IBOutlet ZBAudioPlayerView *audioPlayerView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;


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
 
+(AVAudioPlayer *)sharedAudioPlayer {
    static dispatch_once_t pred;
    static AVAudioPlayer *shared = nil;

    dispatch_once(&pred, ^{
        shared = [[AVAudioPlayer alloc] init];
    });
    return shared;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.audioPlayerView.artistNameLabel.text = self.monk.name;
    self.audioPlayerView.trackNameLabel.text = self.monk.currentTalk;
    self.audioPlayerView.albumArtwork.image = self.monk.image;
    self.audioPlayerView.backgroundArtwork.image = [UIImage imageNamed:@"BroadView.png"];
    
    }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.loadingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 250, 44, 44)];
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimating];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSError *error;
    self.sharedAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.talkURL error:&error];
    [self.sharedAudioPlayer prepareToPlay];
    [self playOrPauseCurrentTrack];
    

}

- (void)playOrPauseCurrentTrack
{
    if ([self.sharedAudioPlayer isPlaying]) {
        [self.sharedAudioPlayer pause];
        [self stopTimer];
    } else {
        [self.sharedAudioPlayer play];
        [self startTimer];
        [_loadingView removeFromSuperview];
    }
    // title may become unsynced with playing state...
    
}
- (void)skipAheadFifteenSeconds
{
    NSTimeInterval time = [self.sharedAudioPlayer currentTime];
    time+=SKIP_TIME;
    if (time > self.sharedAudioPlayer.duration) {
        //nothing to do
    } else {
        [self.sharedAudioPlayer setCurrentTime:time];
    }
    [self didPlayForSecond];
}

- (void)goBackFifteenSeconds
{
    NSTimeInterval time = [self.sharedAudioPlayer currentTime];
    time-=SKIP_TIME;
    if (time < 0) {
        //nothing to do
    } else {
        [self.sharedAudioPlayer setCurrentTime:time];
    }
    [self didPlayForSecond];
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
    NSString *currentTime = [NSString stringWithFormat:@"%d:%02d", (int)self.sharedAudioPlayer.currentTime / 60, (int)self.sharedAudioPlayer.currentTime % 60, nil];
    NSString *remainingTime = [NSString stringWithFormat:@"-%d:%02d", (int)(self.sharedAudioPlayer.duration - self.sharedAudioPlayer.currentTime) / 60, (int)(self.sharedAudioPlayer.duration - self.sharedAudioPlayer.currentTime) % 60, nil];
    [self.audioPlayerView updateLabelsForTime:currentTime remainingTime:remainingTime];
    
    [self.audioPlayerView updateSliderForTime:[self.sharedAudioPlayer currentTime] remainingTime:[self.sharedAudioPlayer duration]];
}

- (void)slideTheSlider:(NSTimeInterval)sliderValue
{
    self.sharedAudioPlayer.currentTime = self.sharedAudioPlayer.duration * sliderValue;
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [self.backgroundMusicPlayer stop];
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
