//
//  ViewController.m
//  Test Host
//
//  Created by Brian Nickel on 8/14/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *bgLabel;
@property (weak, nonatomic) IBOutlet UILabel *fgLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didForeground:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)didBackground:(NSNotification *)notification
{
    self.bgLabel.text = @"Did Background";
}

- (void)didForeground:(NSNotification *)notification
{
    self.fgLabel.text = @"Did Foreground";
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
