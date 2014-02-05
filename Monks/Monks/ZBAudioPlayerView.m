//
//  ZBAudioPlayerView.m
//  Monks
//
//  Created by Zuri Biringer on 2/3/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioPlayerView.h"

@interface ZBAudioPlayerView ()

@property (nonatomic, weak) IBOutlet UIButton *playButton;

@end

@implementation ZBAudioPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)updateLabelsForTime:(NSString *)currentTime
{
    [self updateLabelsForTime:currentTime remainingTime:nil];
}

- (void)updateLabelsForTime:(NSString *)currentTime remainingTime:(NSString *)remainingTime
{
    self.timeProgressedLabel.text = currentTime;
    self.timeRemainingLabel.text = remainingTime;
}


- (IBAction)playOrPause:(id)sender
{
    [self.delegate playOrPauseCurrentTrack];
    
    UIButton *button = (UIButton *)sender;
    
    
    if ([self.playButton.titleLabel.text isEqualToString:@"Play"]) {
        [button setTitle:@"Pause" forState:UIControlStateNormal];
    } else if ([self.playButton.titleLabel.text isEqualToString:@"Pause"]) {
        [button setTitle:@"Play" forState:UIControlStateNormal];
    }
    
    NSLog(@"%@", self.playButton.titleLabel.text);
    NSLog(@"%@", self.playButton.currentTitle);
}

- (IBAction)skipAheadFifteenSeconds:(id)sender
{
    [self.delegate skipAheadFifteenSeconds];
}

- (IBAction)goBackFifteenSeconds:(id)sender
{
    [self.delegate goBackFifteenSeconds];
}


@end
