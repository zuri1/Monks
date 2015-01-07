//
//  ZBWebViewController.m
//  Monks
//
//  Created by Zuri Biringer on 2/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import "ZBWebViewController.h"

@interface ZBWebViewController ()

@end

@implementation ZBWebViewController

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
	
    _webView.scalesPageToFit = YES;
    [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
