//
//  ZBAboutViewController.m
//  Monks
//
//  Created by Zuri Biringer on 2/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBAboutViewController.h"

@interface ZBAboutViewController ()

@end

@implementation ZBAboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"creativecommons"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://creativecommons.org/licenses/by-nc-nd/4.0/deed.en_GB"];
    }
    
    if ([segue.identifier isEqualToString:@"fsaudio"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://fsaudio.org"];
    }
    
    if ([segue.identifier isEqualToString:@"forgiveness"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://fsaudio.org/viewTalk.php?id=626"];
    }
    
    if ([segue.identifier isEqualToString:@"forgivenessQ"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://fsaudio.org/viewTalk.php?id=627"];
    }
    
    if ([segue.identifier isEqualToString:@"removedart"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://fsaudio.org/viewTalk.php?id=643"];
    }
    
    if ([segue.identifier isEqualToString:@"removedartQ"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://fsaudio.org/viewTalk.php?id=641"];
    }
    
    if ([segue.identifier isEqualToString:@"guidedmed"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://mirror1.birken.ca/dhamma_talks/indiv/Jay/05/"];
    }
    
    if ([segue.identifier isEqualToString:@"ratanagiri"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://ratanagiri.org.uk"];
    }
    
    if ([segue.identifier isEqualToString:@"artofmeditation"]) {
        ZBWebViewController *webVC = (ZBWebViewController *)segue.destinationViewController;
        
        webVC.url = [NSURL URLWithString:@"http://ratanagiri.org.uk/talks/ajahn-munindo/2011/the-art-of-meditation/"];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
