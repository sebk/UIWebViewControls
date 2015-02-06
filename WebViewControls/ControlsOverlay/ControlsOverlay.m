//
//  ControlsOverlay.m
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

#import "ControlsOverlay.h"
#import "UIWebView+Multicast.h"

@interface ControlsOverlay () <UIScrollViewDelegate> {
    
    BOOL _tabBarHidden;
    NSLayoutConstraint *_toolBarBottomConstraint;
}

@property(nonatomic, strong) UIToolbar *toolBar;
@property(nonatomic, weak) UIWebView *webView;
@property(nonatomic, strong) UIBarButtonItem *goLeftButton;

@end


@implementation ControlsOverlay

- (instancetype)initForWebView:(UIWebView*)webView {
    if (self = [super init]) {
        
        _webView = webView;
        [self createUI];
        
        [_webView.multicastDelegate addDelegate:self];
        
        _webView.scrollView.delegate = self;

    }
    return self;
}

- (void)createUI {
    
    self.toolBar = [[UIToolbar alloc] init];
    _toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:_toolBar];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_toolBar]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_toolBar)]];
    _toolBarBottomConstraint = [NSLayoutConstraint constraintWithItem:_toolBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraint:_toolBarBottomConstraint];
    
    UIImage *leftImage = [UIImage imageNamed:@"765-arrow-left-toolbar"];
    self.goLeftButton = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(pressedLeft)];
    [_goLeftButton setEnabled:NO];
    
    [_toolBar setItems:[NSArray arrayWithObject:_goLeftButton]];
    
    _toolBar.alpha = 0.0f;
}

- (void)addControlsToView:(UIView*)view {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:self];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[self(==_toolBar)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self, _toolBar)]];
}

- (void)pressedLeft {
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"ControlsOverlay webView finished loading");
    
    if (webView.canGoBack) {
        [self.goLeftButton setEnabled:YES];
        
        [self showToolBar];
    }
    else {
        [self.goLeftButton setEnabled:NO];
        [self hideToolBar:nil];
    }
}

- (void)hideToolBar:(NSTimer*)timer {
    
    _tabBarHidden = YES;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.toolBar.alpha = 0.0f;
    }];
}

- (void)showToolBar {
    
    _tabBarHidden = NO;
    
    [UIView animateWithDuration:0.2f animations:^{
        self.toolBar.alpha = 1.0f;
    }];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.webView.canGoBack) {
     
        float offset = scrollView.contentOffset.y;
        if (offset < 50 && offset > 0) {
            
            _toolBarBottomConstraint.constant = offset;
        }
        
        if (offset > 51) {
            _toolBarBottomConstraint.constant = 50;
        }
        
        if (offset < 0) {
            _toolBarBottomConstraint.constant = 0;
        }
    }
}


@end
