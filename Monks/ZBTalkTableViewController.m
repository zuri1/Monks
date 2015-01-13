//
//  ZBTalkTableViewController.m
//  Monks
//
//  Created by Zuri Biringer on 1/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBTalkTableViewController.h"
#import "ZBAudioViewController.h"
#import "ZBAppDelegate.h"
#import "ZBMoreTalksTableVC.h"

@interface ZBTalkTableViewController ()

@property (nonatomic) NSMutableArray *talkURLs;
@property (weak, nonatomic) ZBAppDelegate *appDelegate;

@end

@implementation ZBTalkTableViewController

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
    self.appDelegate = (ZBAppDelegate *)[UIApplication sharedApplication].delegate;
    

    self.title = @"Talks";
    
    self.talkURLs = [[NSMutableArray alloc] init];
      for (NSString *string in self.monk.talks) {
        NSString *mp3Path = [[NSBundle mainBundle] pathForResource:string ofType:@"mp3"];
        NSURL *mp3URL = [NSURL fileURLWithPath:mp3Path];
        
        [self.talkURLs addObject:mp3URL];
        
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
    return self.talkURLs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ZBTalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.name.text = self.monk.talks[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"audioPlayer"]) {
        ZBAudioViewController *audioVC = (ZBAudioViewController *)segue.destinationViewController;
        
        
                
        audioVC.talkURL = self.talkURLs[[self.tableView indexPathForSelectedRow].row];
        audioVC.monk = self.monk;
        
        audioVC.monk.currentTalk = self.monk.talks[[self.tableView indexPathForSelectedRow].row];
        
        NSLog(@"Current talk is: %@", self.monk.currentTalk);
        
        }
    
    if ([segue.identifier isEqualToString:@"moreTalks"]) {
       
    }

}


@end
