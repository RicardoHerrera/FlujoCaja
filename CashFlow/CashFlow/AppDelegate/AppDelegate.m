//
//  AppDelegate.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "AppDelegate.h"
#import "UnitOfWork.h"
#import "CashFlowService.h"
#import "ApplicationConstants.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef GENERATE_DUMMY_DATA
    [[CashFlowService sharedService] generateDummyData];
#endif
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[UnitOfWork sharedUnitOfWork] commitChanges];
}

@end
