//
//  ZBTalk.h
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBTalk : NSObject

@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *title;
@property (nonatomic) NSURL *url;

- (id)initWithImage:(UIImage *)aImage
              title:(NSString *)aTitle
                url:(NSURL *)aUrl;

@end