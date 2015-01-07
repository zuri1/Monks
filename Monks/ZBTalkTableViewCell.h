//
//  ZBTalkTableViewCell.h
//  Monks
//
//  Created by Zuri Biringer on 2/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBTableViewCell.h"

@interface ZBTalkTableViewCell : ZBTableViewCell

@property (nonatomic) ZBMonk *monk;
@property (nonatomic) IBOutlet UILabel *name;

@end
