//
//  QDisplayApp.m
//  QDisplay
//
//  Created by Christopher Ashworth on 2/10/11.
//
//  Copyright (c) 2011 Figure 53 LLC, http://figure53.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "QDisplayApp.h"

@interface QDisplayApp (Private)

- (void) updateCountdownLabel:(NSTimer *)t;

@end


@implementation QDisplayApp

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window makeKeyAndOrderFront:self];
    message = [[label stringValue] copy];
    countdownTargetTimeInterval = 0.0;
    countdownTimer = nil;
}

@synthesize window;

- (void) setMessage:(NSString *)newMessage
{
    [message autorelease];
    message = [newMessage copy];
    
    if ( message )
        [label setStringValue:message];
    else
        [label setStringValue:@""];
}

@synthesize message;

- (void) setTimeRemaining:(NSNumber *)newTime
{
    double newSeconds = [newTime doubleValue];
    if (newSeconds <= 0.0) return;
    countdownTargetTimeInterval = [NSDate timeIntervalSinceReferenceDate] + newSeconds;
    [countdownTimer invalidate];
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(updateCountdownLabel:) userInfo:nil repeats:YES];
}

- (NSNumber *) timeRemaining
{
    return [NSNumber numberWithDouble:countdownTargetTimeInterval - [NSDate timeIntervalSinceReferenceDate]];
}


// Added 2016-01-20 by Mathias Halén
@synthesize messageSize;

- (void) setMessageSize:(NSNumber *)newSize
{
    double newMessageSize = [newSize doubleValue];
    label.font = [NSFont systemFontOfSize:newMessageSize];
}

@synthesize messageColor;

- (void) setMessageColor:(NSString *)newColor
{
    NSColor *theNewColor;

    // MARK: Black & White
    if ([newColor  isEqual: @"white"]) {
        
        theNewColor = [NSColor whiteColor];
    }
    if ([newColor  isEqual: @"black"]) {
        
        theNewColor = [NSColor blackColor];
    }
    
    // MARK: Red & Green & Blue
    if ([newColor  isEqual: @"red"]) {
        
        theNewColor = [NSColor redColor];
    }
    if ([newColor  isEqual: @"green"]) {
        
        theNewColor = [NSColor greenColor];
    }
    if ([newColor  isEqual: @"blue"]) {
        
        theNewColor = [NSColor blueColor];
    }
    // MARK: Cyan & Magenta & Yellow
    if ([newColor  isEqual: @"cyan"]) {
        
        theNewColor = [NSColor cyanColor];
    }
    if ([newColor  isEqual: @"magenta"]) {
        
        theNewColor = [NSColor magentaColor];
    }
    if ([newColor  isEqual: @"yellow"]) {
        
        theNewColor = [NSColor yellowColor];
    }
    
   
    //theNewColor = [NSColor blueColor];
    label.textColor = theNewColor;

}


// End of Added 2016-01-20 by Mathias Halén



@end


@implementation QDisplayApp (Private)

- (void) updateCountdownLabel:(NSTimer *)t
{
    double seconds = countdownTargetTimeInterval - [NSDate timeIntervalSinceReferenceDate];
    if (seconds < 0)
    {
        [countdownTimer invalidate];
        countdownTimer = nil;
        
        [countdownLabel setStringValue:@""];
    }
    else
    {
        int hours = (int)(seconds / 3600.0);
        seconds = fmod(seconds, 3600.0);
        int minutes = (int)(seconds / 60.0);
        seconds = fmod(seconds, 60.0);
        if (hours > 0)
            [countdownLabel setStringValue:[NSString stringWithFormat:@"%d:%02d:%@%2.1f",
                                            hours,
                                            minutes,
                                            seconds < 10.0 ? @"0" : @"",
                                            seconds]];
        else
            [countdownLabel setStringValue:[NSString stringWithFormat:@"%d:%@%2.1f",
                                            minutes,
                                            seconds < 10.0 ? @"0" : @"",
                                            seconds]];
    }
}

@end
