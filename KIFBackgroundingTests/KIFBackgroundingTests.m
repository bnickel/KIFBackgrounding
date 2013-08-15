//
//  KIFBackgroundingTests.m
//  KIFBackgroundingTests
//
//  Created by Brian Nickel on 8/14/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import <KIF.h>
#import "KIFSystemTestActor+Suspend.h"

@interface KIFBackgroundingTests : KIFTestCase
@end


@implementation KIFBackgroundingTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    [system suspendForTimeInterval:3 wait:YES];
    [tester waitForTimeInterval:5];
}

@end
