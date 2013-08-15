//
//  AppDelegate.m
//  KIF Background
//
//  Created by Brian Nickel on 8/14/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import "AppDelegate.h"

@interface UIApplication (Suspend)
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    double delayInSeconds = [url.host doubleValue];
    NSLog(@"Path: %@, %@", url, url.host);
    NSLog(@"Time interval: %f", delayInSeconds);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [application launchApplicationWithIdentifier:sourceApplication suspended:NO];
    });
    return YES;
}

@end
