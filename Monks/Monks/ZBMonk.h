//
//  ZBMonk.h
//  Monks
//
//  Created by Zuri Biringer on 2/1/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBMonk : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *talks;
@property (nonatomic, strong) NSString *currentTalk;

- (id)initWithImage:(UIImage *)aImage
              name:(NSString *)aName
              talks:(NSMutableArray *)aTalks;

@end

