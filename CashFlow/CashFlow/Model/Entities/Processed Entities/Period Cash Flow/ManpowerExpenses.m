//
//  PeriodCashFlowManpowerExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "ManpowerExpenses.h"
#import "PeriodExpenses.h"
#import "PeriodInputData.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "SalesIncomes.h"

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
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double fixedManpower = (inputData.fixedManpower)? inputData.fixedManpower.doubleValue : 0;
    
    return fixedManpower;
}

- (double)variable
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    PeriodIncomes *periodIncomes = periodCashFlow.incomes;
    SalesIncomes *salesIncomes = periodIncomes.salesIncomes;
    
    double variableManpowerPercentage = (inputData.variableManpower)? inputData.variableManpower.doubleValue : 0;
    
    return variableManpowerPercentage * salesIncomes.sales;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.fixed + self.variable;
}

@end
