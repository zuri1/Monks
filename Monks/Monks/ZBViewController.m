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
	NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"Amaro1" ofType:@"mp3"];
    NSURL *mp3URL = [NSURL fileURLWithPath:mp3Path];
    
    NSArray *mp3Array = [[NSBundle mainBundle] pathsForResourcesOfType:@"mp3" inDirectory:@"."];
    NSLog(@"%@", mp3Array);
//    
//    NSString *mp3Dir = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"mp3s"];
//    NSURL *mp3DirURL = [NSURL fileURLWithPath:mp3Dir];
//    
//    NSError *err;
//    NSArray *amaroMp3s = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:mp3DirURL includingPropertiesForKeys:[NSArray array] options:0 error:&err];
//    if (amaroMp3s == nil) {
//        NSLog(@"Array of amaroMp3 urls not returned");
//    }
//    NSLog(@"%@", amaroMp3s);
    
    NSError *error;
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error:&error];
    [_backgroundMusicPlayer prepareToPlay];
    [_backgroundMusicPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
