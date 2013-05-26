//
//  PeriodCashFlowIncomes.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodIncomes.h"
#import "SalesIncomes.h"

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
    return 0.0;
}

- (double)loans
{
    return 0.0;
}

- (double)salesIGV
{
    return 0.0;
}

@end
