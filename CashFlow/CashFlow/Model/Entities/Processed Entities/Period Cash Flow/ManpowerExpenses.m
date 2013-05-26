//
//  PeriodCashFlowManpowerExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "ManpowerExpenses.h"
#import "PeriodExpenses.h"

@implementation ManpowerExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.manpowerExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)fixed
{
    return 0.0;
}

- (double)variable
{
    return 0.0;
}

- (double)total
{
    return 0.0;
}

@end
