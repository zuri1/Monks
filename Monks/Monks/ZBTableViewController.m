//
//  ZBTableViewController.m
//  Monks
//
//  Created by Zuri Biringer on 12/10/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZBTableViewController.h"

@interface ZBTableViewController ()

@end

@implementation ZBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    ZBTalk *talk = [[ZBTalk alloc] init];
    talk.title  = @"Ajahn Amaro";
    talk.image = [UIImage imageNamed:@"Ajahn_Amaro.jpg"];
    
    ZBTalk *talk2 = [[ZBTalk alloc] init];
    talk2.title  = @"Ajahn Chah";
    talk2.image = [UIImage imageNamed:@"Ajahn_Chah.jpg"];

    ZBTalk *talk3 = [[ZBTalk alloc] init];
    talk3.title  = @"Ajahn Jayasaro";
    talk3.image = [UIImage imageNamed:@"Ajahn_Jayasaro.jpg"];

    ZBTalk *talk4 = [[ZBTalk alloc] init];
    talk4.title  = @"Ajahn Munindo";
    talk4.image = [UIImage imageNamed:@"Ajahn_Munindo.jpg"];

    ZBTalk *talk5 = [[ZBTalk alloc] init];
    talk5.title  = @"Ajahn Pasanno";
    talk5.image = [UIImage imageNamed:@"Ajahn_Pasanno.jpg"];

    ZBTalk *talk6 = [[ZBTalk alloc] init];
    talk6.title  = @"Ajahn Sona";
    talk6.image = [UIImage imageNamed:@"Ajahn_Sona.jpg"];

    ZBTalk *talk7 = [[ZBTalk alloc] init];
    talk7.title  = @"Ajahn Sumedho";
    talk7.image = [UIImage imageNamed:@"Ajahn_Sumedho.jpg"];

    ZBTalk *talk8 = [[ZBTalk alloc] init];
    talk8.title  = @"Ajahn Viradhammo";
    talk8.image = [UIImage imageNamed:@"Ajahn_Viradhammo.jpg"];

    ZBTalk *talk9 = [[ZBTalk alloc] init];
    talk9.title  = @"Ayya Khema";
    talk9.image = [UIImage imageNamed:@"Ayya_Khema.jpg"];
    
    _talks = [NSMutableArray arrayWithObjects:talk, talk2, talk3, talk4, talk5, talk6, talk7,
              talk8, talk9, nil];
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
    return _talks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ZBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.title.text = [_talks[indexPath.row] title];
    cell.imageView.image = [_talks[indexPath.row] image];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
