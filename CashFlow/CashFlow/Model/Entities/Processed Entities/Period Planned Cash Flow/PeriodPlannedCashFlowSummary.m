//
//  PeriodPlannedCashFlowSummary.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedCashFlowSummary.h"
#import "PeriodPlannedCashFlow.h"

@implementation PeriodPlannedCashFlowSummary

#pragma mark -
#pragma mark Custom Accessors

- (PeriodPlannedCashFlow *)plannedCashFlow
{
    if (!_plannedCashFlow) {
        self.plannedCashFlow = [[PeriodPlannedCashFlow alloc] init];
        self.plannedCashFlow.cashFlowSummary = self;
    }
    
    return _plannedCashFlow;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)netIncomesExpenses
{
    return 0.0;
}

- (double)startBalance
{
    return 0.0;
}

- (double)endBalance
{
    return 0.0;
}

@end
