//
//  KIFSystemTestActor+Suspend.h
//  KIFBackgrounding
//
//  Created by Brian Nickel on 8/14/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import "KIFSystemTestActor.h"

@interface KIFSystemTestActor (Suspend)

- (void)suspendForTimeInterval:(NSTimeInterval)timeInterval wait:(BOOL)wait;

@end
