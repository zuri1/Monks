//
//  ZBTableViewController.m
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZBTableViewController.h"
#import "ZBTalkTableViewController.h"

@interface ZBTableViewController ()

@end

@implementation ZBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Monks";
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ZBMonks" ofType:@"plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *plistArray = [plistDict objectForKey:@"Monks"];
    
    
    self.monks = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in plistArray) {
        ZBMonk *newMonk = [[ZBMonk alloc] init];
        newMonk.name = [dict objectForKey:@"name"];
        newMonk.talks = [dict objectForKey:@"talks"];
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", newMonk.name];
        newMonk.image = [UIImage imageNamed:imageName];
        
        [self.monks addObject:newMonk];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _monks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ZBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.name.text = [_monks[indexPath.row] name];
    cell.imageView.image = [_monks[indexPath.row] image];
    
    return cell;
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"talksView"]) {
        ZBTalkTableViewController *talksVC = (ZBTalkTableViewController *)segue.destinationViewController;
        
        talksVC.monk = self.monks[[self.tableView indexPathForSelectedRow].row];
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
