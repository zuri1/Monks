//
//  ZBViewController.h
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBMonk.h"
#import <AVFoundation/AVFoundation.h>

@protocol ZBAudioViewControllerDelegate <NSObject>

@required
- (void)stopPlayingTrack;

@end

@interface ZBAudioViewController : UIViewController

@property (nonatomic, unsafe_unretained) IBOutlet id<ZBAudioViewControllerDelegate> delegate;
@property (nonatomic, weak) NSURL *talkURL;
@property (nonatomic, weak) ZBMonk *monk;

@end
