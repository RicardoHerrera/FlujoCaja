//
//  PeriodCashFlowExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodExpenses.h"
#import "RawMaterialExpenses.h"
#import "ManpowerExpenses.h"
#import "SalaryExpenses.h"
#import "IncomeTaxesExpenses.h"
#import "LoanExpenses.h"

@implementation PeriodExpenses

#pragma mark -
#pragma mark Custom Accessors

- (RawMaterialExpenses *)rawMaterialExpenses
{
    if (!_rawMaterialExpenses) {
        self.rawMaterialExpenses = [[RawMaterialExpenses alloc] init];
        self.rawMaterialExpenses.periodExpenses = self;
    }
    
    return _rawMaterialExpenses;
}

- (ManpowerExpenses *)manpowerExpenses
{
    if (!_manpowerExpenses) {
        self.manpowerExpenses = [[ManpowerExpenses alloc] init];
        self.manpowerExpenses.periodExpenses = self;
    }
    
    return _manpowerExpenses;
}

- (SalaryExpenses *)salaryExpenses
{
    if (!_salaryExpenses) {
        self.salaryExpenses = [[SalaryExpenses alloc] init];
        self.salaryExpenses.periodExpenses = self;
    }
    
    return _salaryExpenses;
}

- (IncomeTaxesExpenses *)incomeTaxesExpenses
{
    if (!_incomeTaxesExpenses) {
        self.incomeTaxesExpenses = [[IncomeTaxesExpenses alloc] init];
        self.incomeTaxesExpenses.periodExpenses = self;
    }
    
    return _incomeTaxesExpenses;
}

- (LoanExpenses *)loanExpenses
{
    if (!_loanExpenses) {
        self.loanExpenses = [[LoanExpenses alloc] init];
        self.loanExpenses.periodExpenses = self;
    }
    
    return _loanExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)assetsPurchases
{
    return 0.0;
}

- (double)taxCredit
{
    return 0.0;
}

- (double)administrativeExpenses
{
    return 0.0;
}

- (double)dividends
{
    return 0.0;
}


@end
