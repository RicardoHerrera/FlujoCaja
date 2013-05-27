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
    
    double oldLoans = (inputData.oldLoanExpenses)? inputData.oldLoanExpenses.doubleValue : 0;
    
    return oldLoans;
}

- (double)newLoans
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double newLoans = (inputData.newLoanExpenses)? inputData.newLoanExpenses.doubleValue : 0;
    
    return newLoans;
}

@end
