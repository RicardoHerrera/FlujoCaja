//
//  PeriodCashFlow.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "PeriodExpenses.h"
#import "PeriodInputData.h"

@implementation PeriodCashFlow

#pragma mark -
#pragma mark Custom Accessors

- (PeriodIncomes *)incomes
{
    if (!_incomes) {
        self.incomes = [[PeriodIncomes alloc] init];
        self.incomes.periodCashFlow = self;
    }
    
    return _incomes;
}

- (PeriodExpenses *)expenses
{
    if (!_expenses) {
        self.expenses = [[PeriodExpenses alloc] init];
        self.expenses.periodCashFlow = self;
    }
    
    return _expenses;
}

- (PeriodCashFlow *)lastPeriodCashFlow
{
    if (!_lastPeriodCashFlow) {
        self.lastPeriodCashFlow = [[PeriodCashFlow alloc] init];
    }
    
    return _lastPeriodCashFlow;
}

@end
