//
//  ZBTableViewCell.h
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBTalk.h"

@interface ZBTableViewCell : UITableViewCell

@property (nonatomic) ZBTalk *talk;

@property (nonatomic) IBOutlet UILabel *title;
@property (nonatomic) IBOutlet UIImageView *imageView;

@end