//
//  MulticastDelegate.h
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

/*
 Thanks to http://www.scottlogic.com/blog/2012/11/19/a-multicast-delegate-pattern-for-ios-controls.html
 */

@import Foundation;

@interface MulticastDelegate : NSObject

// Adds the given delegate implementation to the list of observers
- (void)addDelegate:(id)delegate;

@end
