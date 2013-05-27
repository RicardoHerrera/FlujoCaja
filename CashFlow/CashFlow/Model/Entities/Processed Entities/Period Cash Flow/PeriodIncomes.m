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

@implementation PeriodIncomes

#pragma mark -
#pragma mark Custom Accessors

- (SalesIncomes *)salesIncomes
{
    if (!_salesIncomes) {
        self.salesIncomes = [[SalesIncomes alloc] init];
    }
    
    return _salesIncomes;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)debtCollections
{
    SalesIncomes *salesIncomes = self.salesIncomes;
    
    return salesIncomes.cash + salesIncomes.credit + salesIncomes.penalty;
}

- (double)loans
{
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double loans = (inputData.loanIncomes)? inputData.loanIncomes.doubleValue : 0;
    
    return loans;
}

- (double)salesIGV
{
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    SalesIncomes *salesIncomes = self.salesIncomes;
    
    double igv = (inputData.igv)? inputData.igv.doubleValue : 0;
    
    return (salesIncomes.sales / (1 + igv)) * igv;
}

@end
