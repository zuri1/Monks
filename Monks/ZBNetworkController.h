//
//  ZBNetworkController.h
//  Monks
//
//  Created by Zuri Biringer on 7/2/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZBConnectionCompletion)(NSInteger statusCode, id responseObject);
extern BOOL ZBConnectionRequestIsSuccessful(NSUInteger statusCode);

@interface ZBNetworkController : NSObject

+ (ZBNetworkController *)sharedController;

@end
