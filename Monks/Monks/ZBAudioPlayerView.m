//
//  ZBAudioPlayerView.m
//  Monks
//
//  Created by Zuri Biringer on 2/3/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioPlayerView.h"

@interface ZBAudioPlayerView ()

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

- (void)updateSliderForTime:(NSTimeInterval)currentTimeInterval remainingTime:(NSTimeInterval)remainingTimeInterval
{
    self.progressBar.value = currentTimeInterval / remainingTimeInterval;
}

- (IBAction)playOrPause:(id)sender
{
    [self.delegate playOrPauseCurrentTrack];
    
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    
    if (button.tag == 1) {
        [button setImage:[UIImage imageNamed:@"PauseIcon.png"]];
        [button setTag:0];
        NSLog(@"%ld", (long)button.tag);
    } else {
        [button setImage:[UIImage imageNamed:@"PlayIcon.png"]];
        [button setTag:1];
        NSLog(@"%ld", (long)button.tag);
    }
    
}

- (IBAction)skipAheadFifteenSeconds:(id)sender
{
    [self.delegate skipAheadFifteenSeconds];
}

- (IBAction)goBackFifteenSeconds:(id)sender
{
    [self.delegate goBackFifteenSeconds];
}

- (IBAction)slideTheSlider:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSTimeInterval senderValue = (NSTimeInterval)slider.value;
    [self.delegate slideTheSlider:senderValue];
}

@end
