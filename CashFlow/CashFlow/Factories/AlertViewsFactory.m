//
//  AlertViewsFactory.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "AlertViewsFactory.h"

@implementation AlertViewsFactory

#pragma mark -
#pragma mark Object Lifecycle

+ (id)sharedFactory
{
    static AlertViewsFactory *_sharedFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[AlertViewsFactory alloc] init];
    });
    return _sharedFactory;
}

#pragma mark -
#pragma mark Public Methods

- (UIAlertView *)createAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                              message:title
                                                             delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                    otherButtonTitles:nil];
    
    return alertView;
}

@end
