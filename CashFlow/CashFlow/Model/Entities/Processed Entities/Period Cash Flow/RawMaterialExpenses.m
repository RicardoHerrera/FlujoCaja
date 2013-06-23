//
//  PeriodCashFlowRawMaterialExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "RawMaterialExpenses.h"
#import "PeriodExpenses.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "SalesIncomes.h"
#import "PeriodInputData.h"
#import "CashFlow.h"
#import "Period.h"
#import "FirstPeriodInputData.h"

@implementation RawMaterialExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.rawMaterialExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)rawMaterials
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    if (periodCashFlow.periodNumber == 0) {
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        return (firstPeriodInputData.rawMaterials)? firstPeriodInputData.rawMaterials.doubleValue : 0.0;
    }
    
    PeriodIncomes *incomes = periodCashFlow.incomes;
    SalesIncomes *salesIncomes = incomes.salesIncomes;
    
    double baseRawMaterials = (inputData.baseRawMaterials)? inputData.baseRawMaterials.doubleValue : 0;
    double rawMaterialsPercentage = (inputData.rawMaterials)? inputData.rawMaterials.doubleValue : 0;
    
    return baseRawMaterials + salesIncomes.sales * rawMaterialsPercentage;
}

- (double)cash
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double rawMaterialsCashPayment = (inputData.rawMaterialsCashPayment)? inputData.rawMaterialsCashPayment.doubleValue : 0;
    
    return self.rawMaterials * rawMaterialsCashPayment;
}

- (double)credit
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    PeriodCashFlow *lastPeriodCashFlow = periodCashFlow.lastPeriodCashFlow;
    
    double rawMaterialsPayment = (inputData.rawMaterialsPayment)? inputData.rawMaterialsPayment.doubleValue : 0;
    
    return lastPeriodCashFlow.expenses.rawMaterialExpenses.rawMaterials * rawMaterialsPayment;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.cash + self.credit;
}

@end
