//
//  UIWebView+Multicast.m
//  WebViewControls
//
//  Created by Sebastian Kruschwitz on 06.02.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

#import "UIWebView+Multicast.h"
#import <objc/runtime.h>

@implementation UIWebView (Multicast)

NSString* const WebViewMulticastDelegateKey = @"multicastDelegate";

- (MulticastDelegate *)multicastDelegate
{
    // do we have a SHCMulticastDelegate associated with this class?
    id multicastDelegate = objc_getAssociatedObject(self, (__bridge const void *)(WebViewMulticastDelegateKey));
    if (multicastDelegate == nil) {
        
        // if not, create one
        multicastDelegate = [[MulticastDelegate alloc] init];
        objc_setAssociatedObject(self, (__bridge const void *)(WebViewMulticastDelegateKey), multicastDelegate, OBJC_ASSOCIATION_RETAIN);
        
        // and set it as the delegate
        self.delegate = multicastDelegate;
    }
    
    return multicastDelegate;
}

@end
