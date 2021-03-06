//
//  PeriodCashFlowIncomes.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodIncomes.h"
#import "SalesIncomes.h"
#import "PeriodInputData.h"
#import "PeriodCashFlow.h"
#import "CashFlow.h"
#import "FirstPeriodInputData.h"
#import "Period.h"

@interface PeriodIncomes ()

@end

@implementation PeriodIncomes

#pragma mark -
#pragma mark Custom Accessors

- (SalesIncomes *)salesIncomes
{
    if (!_salesIncomes) {
        self.salesIncomes = [[SalesIncomes alloc] init];
        self.salesIncomes.periodIncomes = self;
    }
    
    return _salesIncomes;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)debtCollections
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    SalesIncomes *salesIncomes = self.salesIncomes;
    
    return salesIncomes.cash + salesIncomes.credit + salesIncomes.penalty;
}

- (double)loans
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double loans = (inputData.loanIncomes)? inputData.loanIncomes.doubleValue : 0;
    
    return loans;
}

- (double)salesIGV
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    SalesIncomes *salesIncomes = self.salesIncomes;
    
    double igv;
    
    if (periodCashFlow.periodNumber == 0) {
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        igv = (firstPeriodInputData.igv)? firstPeriodInputData.igv.doubleValue : 0.0;
    }
    else {
        igv = (inputData.igv)? inputData.igv.doubleValue : 0;
    }
    
    return (salesIncomes.sales / (1 + igv)) * igv;
}

@end
