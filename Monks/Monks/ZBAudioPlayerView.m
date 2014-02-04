//
//  ZBAudioPlayerView.m
//  Monks
//
//  Created by Zuri Biringer on 2/3/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAudioPlayerView.h"

@implementation ZBAudioPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)playOrPause:(id)sender
{
    [self.delegate playOrPauseCurrentTrack];
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
