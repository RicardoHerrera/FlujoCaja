//
//  GridOrientationSupportViewController.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/23/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GridOrientationSupportViewController.h"

@interface GridOrientationSupportViewController ()

@end

@implementation GridOrientationSupportViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self fixupGridWithOrientation:toInterfaceOrientation];
}

#pragma mark -
#pragma mark Public Methods

- (void)setupGrid
{
    
}

#pragma mark -
#pragma mark Private Methods

- (void)fixupGridWithOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (self.grid) {
        self.grid.frame = [self gridFrameForOrientation:toInterfaceOrientation];
    }
}

- (CGRect)gridFrameForOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
    }
    else {
        return CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH - 44);
    }
}

@end
