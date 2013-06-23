//
//  LoanExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "LoanExpenses.h"
#import "PeriodExpenses.h"
#import "PeriodInputData.h"
#import "PeriodCashFlow.h"
#import "CashFlow.h"
#import "FirstPeriodInputData.h"
#import "Period.h"

@implementation LoanExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.loanExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)oldLoans
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    if (periodCashFlow.periodNumber == 0) {
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        return (firstPeriodInputData.oldLoans)? firstPeriodInputData.oldLoans.doubleValue * -1 : 0.0;
    }
    
    double oldLoans = (inputData.oldLoanExpenses)? inputData.oldLoanExpenses.doubleValue : 0;
    
    return oldLoans * -1;
}

- (double)newLoans
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double newLoans = (inputData.newLoanExpenses)? inputData.newLoanExpenses.doubleValue : 0;
    
    return newLoans * -1;
}

@end
