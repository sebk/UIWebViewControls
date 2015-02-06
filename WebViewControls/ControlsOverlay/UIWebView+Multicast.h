//
//  UIWebView+Multicast.h
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "MulticastDelegate.h"

@interface UIWebView (Multicast)

@property (readonly) MulticastDelegate* multicastDelegate;

@end
