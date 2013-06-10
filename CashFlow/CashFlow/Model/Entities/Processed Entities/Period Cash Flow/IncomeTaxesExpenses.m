//
//  TaxesExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "IncomeTaxesExpenses.h"
#import "PeriodExpenses.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "SalesIncomes.h"
#import "PeriodInputData.h"
#import "Period.h"

@implementation IncomeTaxesExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.incomeTaxesExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)advancePayment
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    PeriodIncomes *incomes = periodCashFlow.incomes;
    SalesIncomes *salesIncomes = incomes.salesIncomes;
    
    double incomeTax = (inputData.incomeTax)? inputData.incomeTax.doubleValue : 0;
    
    return salesIncomes.sales * incomeTax;
}

- (double)regularization
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double regularization = (inputData.incomeTaxRegularization)? inputData.incomeTaxRegularization.doubleValue : 0;
    NSInteger month = (periodCashFlow.date)? periodCashFlow.date.month : 0; 
    
    return (month == 3)? regularization : 0;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.advancePayment + self.regularization;
}

@end
