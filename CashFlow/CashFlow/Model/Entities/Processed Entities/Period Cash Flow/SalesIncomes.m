//
//  PeriodCashFlowIncomesSales.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "SalesIncomes.h"
#import "PeriodIncomes.h"

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
    return 0.0;
}

- (double)cash
{
    return 0.0;
}

- (double)credit
{
    return 0.0;
}

- (double)penalty
{
    return 0.0;
}

- (double)badDebts
{
    return 0.0;
}

@end
