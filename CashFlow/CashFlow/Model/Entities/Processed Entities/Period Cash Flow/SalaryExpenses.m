//
//  SalaryExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "SalaryExpenses.h"
#import "PeriodExpenses.h"

@implementation SalaryExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.salaryExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)payroll
{
    return 0.0;
}

- (double)socialBenefits
{
    return 0.0;
}

- (double)total
{
    return 0.0;
}

@end
