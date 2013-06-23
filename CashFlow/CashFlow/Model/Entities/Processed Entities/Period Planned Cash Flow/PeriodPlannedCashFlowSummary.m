//
//  PeriodPlannedCashFlowSummary.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedCashFlowSummary.h"
#import "PeriodPlannedCashFlow.h"
#import "PeriodCashFlow.h"
#import "PeriodPlannedExpenses.h"
#import "PeriodPlannedIncomes.h"
#import "FirstPeriodInputData.h"
#import "Period.h"
#import "CashFlow.h"
#import "PeriodInputData.h"

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
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodPlannedCashFlow *periodPlannedCashFlow = self.plannedCashFlow;
    PeriodPlannedExpenses *expenses = periodPlannedCashFlow.expenses;
    PeriodPlannedIncomes *incomes = periodPlannedCashFlow.incomes;
    
    return incomes.total + expenses.total;
}

- (double)startBalance
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodPlannedCashFlow *periodPlannedCashFlow = self.plannedCashFlow;
    PeriodPlannedCashFlow *lastPeriodPlannedCashFlow = periodPlannedCashFlow.lastPlannedCashFlow;
    
    PeriodPlannedCashFlowSummary *cashFlowSummary = lastPeriodPlannedCashFlow.cashFlowSummary;
    
    return cashFlowSummary.endBalance;
}

- (double)endBalance
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        PeriodInputData *inputData = periodCashFlow.inputData;
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        return (firstPeriodInputData.endBalance)? firstPeriodInputData.endBalance.doubleValue : 0.0;
    }
    
    return self.netIncomesExpenses + self.startBalance;
}

@end
