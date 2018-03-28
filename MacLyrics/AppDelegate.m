//
//  AppDelegate.m
//  MacLyrics
//
//  Created by Zihao Zhang on 2/19/15.
//  Copyright (c) 2015 Zihao Zhang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *statusMenu;

@end

@implementation AppDelegate

@synthesize statusBar = _statusBar;

- (void)awakeFromNib
{
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self.statusBar setTitle:@"ML"];
    [self.statusBar setHighlightMode:YES];
    [self.statusBar setMenu:self.statusMenu];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
