//
//  ViewController.m
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

#import "ViewController.h"
#import "ControlsOverlay.h"
#import "UIWebView+Multicast.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.de"]];
    [self.webView loadRequest:request];
    
    [self.webView.multicastDelegate addDelegate:self];
    
    ControlsOverlay *controls = [[ControlsOverlay alloc] initForWebView:self.webView];
    [controls addControlsToView:self.view];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"ViewController webView finished loading");
}


@end
