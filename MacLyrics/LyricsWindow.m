//
//  LyricsWindow.m
//  MacLyrics
//
//  Created by Zihao Zhang on 2/19/15.
//  Copyright (c) 2015 Zihao Zhang. All rights reserved.
//

#import "LyricsWindow.h"
#include <Carbon/Carbon.h>

@implementation LyricsWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:NSBorderlessWindowMask backing:bufferingType defer:flag];
    
    if(self)
    {
        [self setOpaque:NO];
        [self setHasShadow:YES];
        [self setLevel:NSFloatingWindowLevel];
        [self setAlphaValue:0.2];
        [self setIgnoresMouseEvents:YES];
    }
    
    CGFloat x = 200;
    CGFloat y = 100;
    CGFloat w = NSScreen.mainScreen.frame.size.width - (x*2);
    CGFloat h = 100;
    
    [self setFrame:CGRectMake(x, y, w, h) display:YES animate:NO];
    
    return self;
}

- (void)awakeFromNib
{
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:[[self contentView] bounds]
                                                                options:NSTrackingMouseEnteredAndExited|NSTrackingActiveAlways
                                                                  owner:self
                                                               userInfo:nil];
    [[self contentView] addTrackingArea:trackingArea];
}

#pragma mark - Mouse

// If the mouse enters a window, go make sure we fade in
- (void)mouseEntered:(NSEvent *)theEvent
{
    // Use Core Animation to fade in both windows.
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        
        [[self animator] setAlphaValue:1.0];
        
    } completionHandler:^{
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
    }];
}

// If the mouse exits a window, go make sure we fade out
- (void)mouseExited:(NSEvent *)theEvent
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        
        [[self animator] setAlphaValue:0.2];
        
    } completionHandler:^{
        
        // Stop all calls to moveCursor to suspend the movement of the trackingWin.
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
    }];
}

@end
