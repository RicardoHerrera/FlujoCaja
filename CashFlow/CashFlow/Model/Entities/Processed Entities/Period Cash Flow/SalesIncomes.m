//
//  PeriodCashFlowIncomesSales.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "SalesIncomes.h"
#import "PeriodIncomes.h"
#import "PeriodCashFlow.h"
#import "PeriodInputData.h"
#import "Period.h"
#import "CashFlow.h"
#import "FirstPeriodInputData.h"

@implementation SalesIncomes

#pragma mark -
#pragma mark Custom Accessors

- (PeriodIncomes *)periodIncomes
{
    if (!_periodIncomes) {
        self.periodIncomes = [[PeriodIncomes alloc] init];
        self.periodIncomes.salesIncomes = self;
    }
    
    return _periodIncomes;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)sales
{
    PeriodCashFlow *periodCashFlow = self.periodIncomes.periodCashFlow;
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    if (periodCashFlow.periodNumber == 0) {
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        
        return (firstPeriodInputData.sales)? firstPeriodInputData.sales.doubleValue : 0.0;
    }
    
    double sales = (inputData.sales)? inputData.sales.doubleValue : 0;
    
    return sales;
}

- (double)cash
{
    PeriodCashFlow *periodCashFlow = self.periodIncomes.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double cashDebtCollections = (inputData.cashDebtCollections)? inputData.cashDebtCollections.doubleValue : 0;
    
    return self.sales * cashDebtCollections;
}

- (double)credit
{
    PeriodCashFlow *periodCashFlow = self.periodIncomes.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    PeriodCashFlow *lastPeriodCashFlow = periodCashFlow.lastPeriodCashFlow;
    
    double debtCollections = (inputData.debtCollections)? inputData.debtCollections.doubleValue : 0;
    
    return lastPeriodCashFlow.incomes.salesIncomes.sales * debtCollections;
}

- (double)penalty
{
    PeriodCashFlow *periodCashFlow = self.periodIncomes.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double penalty = (inputData.creditSalesPenalty)? inputData.creditSalesPenalty.doubleValue : 0;
    
    return self.credit * penalty;
}

- (double)badDebts
{
    PeriodCashFlow *periodCashFlow = self.periodIncomes.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double badDebtsPercentage = (inputData.badDebts)? inputData.badDebts.doubleValue : 0;
    
    return self.sales * badDebtsPercentage;
}

@end
