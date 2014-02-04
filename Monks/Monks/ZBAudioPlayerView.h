//
//  ZBAudioPlayerView.h
//  Monks
//
//  Created by Zuri Biringer on 2/3/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBAudioPlayerViewDelegate <NSObject>

@required
- (void)playOrPauseCurrentTrack;
@optional
- (void)skipAheadFifteenSeconds;
- (void)goBackFifteenSeconds;

@end

@interface ZBAudioPlayerView : UIView

@property (nonatomic, unsafe_unretained) IBOutlet id<ZBAudioPlayerViewDelegate> delegate;
//^why isn't this hooked up?

@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel, *trackNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *albumArtwork;

- (IBAction)playOrPause:(id)sender;
- (IBAction)skipAheadFifteenSeconds:(id)sender;
- (IBAction)goBackFifteenSeconds:(id)sender;

@end
