//
//  PeriodPlannedExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedExpenses.h"
#import "PeriodPlannedCashFlow.h"

@implementation PeriodPlannedExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodPlannedCashFlow *)plannedCashFlow
{
    if (!_plannedCashFlow) {
        self.plannedCashFlow = [[PeriodPlannedCashFlow alloc] init];
        self.plannedCashFlow.expenses = self;
    }
    
    return _plannedCashFlow;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)rawMaterialsAndAssetsPurchases
{
    return 0.0;
}

- (double)manpower
{
    return 0.0;
}

- (double)salaries
{
    return 0.0;
}

- (double)administrativeExpenses
{
    return 0.0;
}

- (double)salesCommissions
{
    return 0.0;
}

- (double)dividends
{
    return 0.0;
}

- (double)loans
{
    return 0.0;
}

- (double)incomeTaxes
{
    return 0.0;
}

- (double)igv
{
    return 0.0;
}

@end
