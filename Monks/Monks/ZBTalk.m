//
//  ZBTalk.m
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZBTalk.h"

@implementation ZBTalk

- (id)init
{
    self = [super init];
    return self;
}

- (id)initWithImage:(UIImage *)aImage
              title:(NSString *)aTitle
                url:(NSURL *)aUrl{
    self = [super init];
    if(self) {
        self.image = aImage;
        self.title = aTitle;
        self.url = aUrl;
    }
    return self;
}

@end