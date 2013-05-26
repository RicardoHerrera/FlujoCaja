//
//  PeriodPlannedIncomes.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedIncomes.h"
#import "PeriodPlannedCashFlow.h"

@implementation PeriodPlannedIncomes

#pragma mark -
#pragma mark Custom Accessors

- (PeriodPlannedCashFlow *)plannedCashFlow
{
    if (!_plannedCashFlow) {
        self.plannedCashFlow = [[PeriodPlannedCashFlow alloc] init];
        self.plannedCashFlow.incomes = self;
    }
    
    return _plannedCashFlow;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)incomeCollections
{
    return 0.0;
}

- (double)newLoans
{
    return 0.0;
}

- (double)totalIncomes
{
    return 0.0;
}

@end
