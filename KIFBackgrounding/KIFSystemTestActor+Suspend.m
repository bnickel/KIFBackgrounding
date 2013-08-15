//
//  KIFSystemTestActor+Suspend.m
//  KIFBackgrounding
//
//  Created by Brian Nickel on 8/14/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import "KIFSystemTestActor+Suspend.h"
#import <UIKit/UIKit.h>
#import <NSError-KIFAdditions.h>

@interface UIApplication (Suspend)
- (void)suspend;
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@implementation KIFSystemTestActor (Suspend)

- (void)suspendForTimeInterval:(NSTimeInterval)timeInterval wait:(BOOL)wait
{
    NSURL *URL = [NSURL URLWithString:[@"kif-background://" stringByAppendingFormat:@"%f", timeInterval]];
    if (![[UIApplication sharedApplication] canOpenURL:URL]) {
        [self failWithError:[NSError KIFErrorWithFormat:@"KIF Background app is not installed."] stopTest:YES];
    }
    
    [[UIApplication sharedApplication] openURL:URL];
    if (wait) {
        [[system usingTimeout:timeInterval + 5] waitForNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
    }
}

@end
