//
//  ZBViewController.m
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBViewController.h"
#import <TDAudioPlayer/TDAudioPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ZBViewController ()

@property (nonatomic, strong) AVAudioPlayer *backgroundMusicPlayer;

@end

@implementation ZBViewController

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
    
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.talkURL error:&error];
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
