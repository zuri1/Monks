//
//  ZBWebViewController.h
//  Monks
//
//  Created by Zuri Biringer on 2/10/14.
//  Copyright (c) 2014 Zuri Biringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBWebViewController : UIViewController

@property (strong, nonatomic) NSURL *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
