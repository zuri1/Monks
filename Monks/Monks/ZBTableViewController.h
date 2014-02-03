//
//  ZBTableViewController.h
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBMonk.h"
#import "ZBTableViewCell.h"

@interface ZBTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *monks;

@end