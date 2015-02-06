//
//  ControlsOverlay.h
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

@import UIKit;

/**
 UIView that adds a UIToolbar to a given UIView, that provides additions options for the UIWebView.
 
 Usage:
 
     ControlsOverlay *controls = [[ControlsOverlay alloc] initForWebView:self.webView];
     [controls addControlsToView:self.view];
 
 You have to use the MulticastDelegate implementation when you want to receive UIWebViewDelegate methods in your own UIViewController classes:
 
     [self.webView.multicastDelegate addDelegate:self];
 
 */
@interface ControlsOverlay : UIView

- (instancetype)initForWebView:(UIWebView*)webView;

- (void)addControlsToView:(UIView*)view;

@end
