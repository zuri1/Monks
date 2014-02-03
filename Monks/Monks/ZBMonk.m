//
//  ZBMonk.m
//  Monks
//
//  Created by Zuri Biringer on 2/1/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBMonk.h"

@interface ZBMonk ()

@end

@implementation ZBMonk

- (id)init
{
    self = [super init];
    return self;
}

- (id)initWithImage:(UIImage *)aImage
              name:(NSString *)aName
             talks:(NSMutableArray *)aTalks
{
    self = [super init];
    if (self) {
        self.image = aImage;
        self.name = aName;
        self.talks = aTalks;

    }
    return self;
}

@end
