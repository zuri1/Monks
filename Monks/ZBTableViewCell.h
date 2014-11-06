//
//  ZBTableViewCell.h
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBMonk.h"

@interface ZBTableViewCell : UITableViewCell

@property (nonatomic) ZBMonk *monk;

@property (nonatomic) IBOutlet UILabel *name;
@property (nonatomic) IBOutlet UIImageView *avatarImageView;

@end