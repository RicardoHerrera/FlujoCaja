//
//  TaxesExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "IncomeTaxesExpenses.h"
#import "PeriodExpenses.h"

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

- (double)tax
{
    return 0.0;
}

- (double)advancePayment
{
    return 0.0;
}

- (double)regularization
{
    return 0.0;
}

- (double)total
{
    return 0.0;
}

@end
