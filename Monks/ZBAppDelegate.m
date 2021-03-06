
//  ZBAppDelegate.m
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZBAppDelegate.h"
#import <Parse/Parse.h>

@implementation ZBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"grcTk9VEGZQencONAP4A6TV5qrf4ad4QuyjpqIPI"
                  clientKey:@"FLgBDOelNbqirRgAqSi1ycLRbv5uqnh7d4YvzUQd"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    self.player = [AVAudioPlayer new];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(interruption:)
                                                 name:AVAudioSessionInterruptionNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(routeChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
    
    return YES;
}

- (void)interruption:(NSNotification *)notification
{
    
}

- (void)routeChange:(NSNotification *)notification
{
    NSLog(@"routeChange:");
    
    NSDictionary *dictionary = notification.userInfo;
    NSInteger routeChangeReason = [[dictionary valueForKey:AVAudioSessionRouteChangeReasonKey] integerValue];
    
    switch (routeChangeReason) {
//        case AVAudioSessionRouteChangeReasonNewDeviceAvailable:
//            NSLog(@"Something happened");
//            if ([self.player isPlaying]) {
//                NSLog(@"Started playing");
//            }
//            [self.player play];
//            break;
            
        case AVAudioSessionRouteChangeReasonOldDeviceUnavailable:
            NSLog(@"Headphones Unplugged");
            [self.player pause];
            
        default:
            break;
    }
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
