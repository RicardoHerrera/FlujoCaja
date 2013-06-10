//
//  PeriodPlannedExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodPlannedExpenses.h"
#import "PeriodPlannedCashFlow.h"
#import "PeriodCashFlow.h"
#import "PeriodExpenses.h"
#import "PeriodIncomes.h"
#import "RawMaterialExpenses.h"
#import "ManpowerExpenses.h"
#import "SalaryExpenses.h"
#import "LoanExpenses.h"
#import "IncomeTaxesExpenses.h"

@implementation PeriodPlannedExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodPlannedCashFlow *)plannedCashFlow
{
    if (!_plannedCashFlow) {
        self.plannedCashFlow = [[PeriodPlannedCashFlow alloc] init];
        self.plannedCashFlow.expenses = self;
    }
    
    return _plannedCashFlow;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)rawMaterialsAndAssetsPurchases
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    RawMaterialExpenses *rawMaterialExpenses = expenses.rawMaterialExpenses;
    
    return rawMaterialExpenses.total + expenses.assetsPurchases;
}

- (double)manpower
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    ManpowerExpenses *manpowerExpenses = expenses.manpowerExpenses;

    return manpowerExpenses.total;
}

- (double)salaries
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    SalaryExpenses *salaryExpenses = expenses.salaryExpenses;

    return salaryExpenses.total;
}

- (double)administrativeExpenses
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;

    return expenses.administrativeExpenses;
}

- (double)salesCommissions
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;

    return expenses.salesCommissions;
}

- (double)dividends
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;

    return expenses.dividends;
}

- (double)loans
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    LoanExpenses *loanExpenses = expenses.loanExpenses;

    return loanExpenses.newLoans + loanExpenses.oldLoans;
}

- (double)incomeTaxes
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    IncomeTaxesExpenses *incomeTaxesExpenses = expenses.incomeTaxesExpenses;

    return incomeTaxesExpenses.total;
}

- (double)igv
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodExpenses *expenses = periodCashFlow.expenses;
    PeriodIncomes *incomes = periodCashFlow.incomes;
    
    return (incomes.salesIGV - expenses.taxCredit) * -1;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.plannedCashFlow.cashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.rawMaterialsAndAssetsPurchases + self.manpower + self.salaries + self.administrativeExpenses + self.salesCommissions + self.dividends + self.loans + self.incomeTaxes + self.igv;
}

@end
