//
//  PeriodPlannedIncomes.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedIncomes.h"
#import "PeriodPlannedCashFlow.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"


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
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodIncomes *incomes = periodCashFlow.incomes;

    return incomes.debtCollections;
}

- (double)newLoans
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodIncomes *incomes = periodCashFlow.incomes;
    
    return incomes.loans;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.incomeCollections + self.newLoans;
}

@end
