//
//  ZBViewController.m
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioViewController.h"
#import "ZBAudioPlayerView.h"
#import "ZBAppDelegate.h"

@interface ZBAudioViewController () <ZBAudioPlayerViewDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;

@property (nonatomic, weak) IBOutlet ZBAudioPlayerView *audioPlayerView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
@property (weak,nonatomic) ZBAppDelegate *appDelegate;



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
    self.appDelegate = (ZBAppDelegate *)[[UIApplication sharedApplication] delegate];

        
    self.audioPlayerView.artistNameLabel.text = self.monk.name;
    self.audioPlayerView.trackNameLabel.text = self.monk.currentTalk;
    self.audioPlayerView.albumArtwork.image = self.monk.image;
    self.audioPlayerView.backgroundArtwork.image = [UIImage imageNamed:@"BroadView.png"];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(interruption:)
//                                                 name:AVAudioSessionRouteChangeNotification
//                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(routeChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
}

//-(void)interruption:(NSNotification *)notification
//{
//    NSLog(@"interruption:");
//}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    NSLog(@"audioPlayerBeginInterruption");
    [self.playButton setImage:[UIImage imageNamed:@"PlayIcon.png"]];
    [self.playButton setTag:1];
}

-(void)routeChange:(NSNotification *)notification
{
    NSLog(@"routeChange:");
    
    NSDictionary *dictionary = notification.userInfo;
    NSInteger routeChangeReason = [[dictionary valueForKey:AVAudioSessionRouteChangeReasonKey] integerValue];
    
    switch (routeChangeReason) {
        case AVAudioSessionRouteChangeReasonNewDeviceAvailable:
            NSLog(@"Something happened");
            
            break;
            
        case AVAudioSessionRouteChangeReasonOldDeviceUnavailable:
            NSLog(@"Headphones Unplugged");
            [self.playButton setImage:[UIImage imageNamed:@"PlayIcon.png"]];
            [self.playButton setTag:1];
        default:
            break;
    }
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
            //[self.appDelegate.player stop];
    if ([self.appDelegate.currentTrack isEqualToString:self.monk.currentTalk]) {
        // do nothing
        [self startTimer];
        [_loadingView removeFromSuperview];
        NSLog(@"The selected talk is already playing");
    } else {
            self.appDelegate.player  = [[AVAudioPlayer alloc] initWithContentsOfURL:self.talkURL error:&error];
            [self.appDelegate.player setDelegate:self];
            [self.appDelegate.player prepareToPlay];
            [self playOrPauseCurrentTrack];
         self.appDelegate.currentTrack = self.monk.currentTalk;
    }
    
}

- (void)playOrPauseCurrentTrack
{
    if ([self.appDelegate.player isPlaying]) {
        [self.appDelegate.player pause];
        [self stopTimer];
    } else {
        [self.appDelegate.player play];
        [self startTimer];
        [_loadingView removeFromSuperview];
    }
    // title may become unsynced with playing state...
    
}
- (void)skipAheadFifteenSeconds
{
    NSTimeInterval time = [self.appDelegate.player currentTime];
    time+=SKIP_TIME;
    if (time > self.appDelegate.player.duration) {
        //nothing to do
    } else {
        [self.appDelegate.player setCurrentTime:time];
    }
    [self didPlayForSecond];
}

- (void)goBackFifteenSeconds
{
    NSTimeInterval time = [self.appDelegate.player currentTime];
    time-=SKIP_TIME;
    if (time < 0) {
        //nothing to do
    } else {
        [self.appDelegate.player setCurrentTime:time];
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
    NSString *currentTime = [NSString stringWithFormat:@"%d:%02d", (int)self.appDelegate.player.currentTime / 60, (int)self.appDelegate.player.currentTime % 60, nil];
    NSString *remainingTime = [NSString stringWithFormat:@"-%d:%02d", (int)(self.appDelegate.player.duration - self.appDelegate.player.currentTime) / 60, (int)(self.appDelegate.player.duration - self.appDelegate.player.currentTime) % 60, nil];
    [self.audioPlayerView updateLabelsForTime:currentTime remainingTime:remainingTime];
    
    [self.audioPlayerView updateSliderForTime:[self.appDelegate.player currentTime] remainingTime:[self.appDelegate.player duration]];
}

- (void)slideTheSlider:(NSTimeInterval)sliderValue
{
    self.appDelegate.player.currentTime = self.appDelegate.player.duration * sliderValue;
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
