//
//  ZBNetworkController.m
//  Monks
//
//  Created by Zuri Biringer on 7/2/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBNetworkController.h"

static NSString *const kAmazonS3URL = @"";

@interface ZBNetworkController ()

@property (strong, nonatomic) NSURLSession *myURLSession;

@end

@implementation ZBNetworkController

+ (ZBNetworkController *)sharedController
{
    static dispatch_once_t dispatchPredicate;
    static ZBNetworkController *sharedController = nil;
    
    dispatch_once(&dispatchPredicate,^{
        sharedController = [[ZBNetworkController alloc] init];
    });
    return sharedController;
}

- (void)downloadMetadataFromS3
{
    
}

@end
