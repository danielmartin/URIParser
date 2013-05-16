//
//  AppDelegate.h
//  URIParser
//
//  Created by Daniel Martín on 4/24/13.
//  Copyright (c) 2013 Daniel Martín. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *URITextField;
@property (assign) IBOutlet NSTextView *resultsTextView;

- (IBAction)parse:(id)sender;

@end
