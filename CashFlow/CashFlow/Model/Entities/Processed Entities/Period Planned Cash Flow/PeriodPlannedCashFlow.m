//
//  PeriodPlannedCashFlow.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedCashFlow.h"
#import "PeriodCashFlow.h"
#import "PeriodPlannedIncomes.h"
#import "PeriodPlannedExpenses.h"
#import "PeriodPlannedCashFlowSummary.h"

@implementation PeriodPlannedCashFlow

#pragma mark -
#pragma mark Custom Accessors

- (PeriodCashFlow *)cashFlow
{
    if (!_cashFlow) {
        self.cashFlow = [[PeriodCashFlow alloc] init];
    }
    
    return _cashFlow;
}

- (PeriodPlannedIncomes *)incomes
{
    if (!_incomes) {
        self.incomes = [[PeriodPlannedIncomes alloc] init];
        self.incomes.plannedCashFlow = self;
    }
    
    return _incomes;
}

- (PeriodPlannedExpenses *)expenses
{
    if (!_expenses) {
        self.expenses = [[PeriodPlannedExpenses alloc] init];
        self.expenses.plannedCashFlow = self;
    }
    
    return _expenses;
}

- (PeriodPlannedCashFlowSummary *)cashFlowSummary
{
    if (!_cashFlowSummary) {
        self.cashFlowSummary = [[PeriodPlannedCashFlowSummary alloc] init];
        self.cashFlowSummary.plannedCashFlow = self;
    }
    
    return _cashFlowSummary;
}

- (PeriodPlannedCashFlowSummary *)lastCashFlowSummary
{
    if (!_lastCashFlowSummary) {
        self.lastCashFlowSummary = [[PeriodPlannedCashFlowSummary alloc] init];
        self.lastCashFlowSummary.plannedCashFlow = self;
    }
    
    return _lastCashFlowSummary;
}

@end
