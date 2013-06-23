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
#import "PeriodInputData.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "SalesIncomes.h"
#import "FirstPeriodInputData.h"
#import "CashFlow.h"
#import "Period.h"

@interface PeriodExpenses ()

@end

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
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double assetsPurchases = (inputData.assetsPurchases)? inputData.assetsPurchases.doubleValue : 0;
    
    return assetsPurchases * -1;
}

- (double)taxCredit
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double igv;

    if (periodCashFlow.periodNumber == 0) {
        Period *period = inputData.period;
        CashFlow *cashFlow = period.cashFlow;
        FirstPeriodInputData *firstPeriodInputData = cashFlow.firstPeriodInputData;
        igv = (firstPeriodInputData.igv)? firstPeriodInputData.igv.doubleValue : 0.0;
        return ((self.rawMaterialExpenses.rawMaterials) / (1 + igv)) * igv;
    }
    else {
        igv = (inputData.igv)? inputData.igv.doubleValue : 0;
        return ((self.rawMaterialExpenses.rawMaterials + self.assetsPurchases) / (1 + igv)) * igv;
    }
}

- (double)administrativeExpenses
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double administrativeExpenses = (inputData.administrativeExpenses)? inputData.administrativeExpenses.doubleValue : 0;
    
    return administrativeExpenses * -1;
}

- (double)salesCommissions
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    PeriodIncomes *incomes = self.periodCashFlow.incomes;
    SalesIncomes *salesIncomes = incomes.salesIncomes;
    
    double salesExpenses = (inputData.salesExpenses)? inputData.salesExpenses.doubleValue : 0;
    
    return salesExpenses * salesIncomes.sales * -1;
}

- (double)dividends
{
    PeriodCashFlow *periodCashFlow = self.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = self.periodCashFlow.inputData;
    
    double dividends = (inputData.dividends)? inputData.dividends.doubleValue : 0;
    
    return dividends * -1;
}


@end
