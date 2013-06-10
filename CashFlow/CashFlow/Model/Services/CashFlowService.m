//
//  CashFlowService.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "CashFlowService.h"
#import "CashFlow.h"
#import "CashFlowPeriodType.h"
#import "Period.h"
#import "PeriodInputData.h"
#import "FirstPeriodInputData.h"

@implementation CashFlowService

#pragma mark -
#pragma mark Class Methods

+ (GenericService *)sharedService
{
    static GenericService *_sharedGenericService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGenericService = [[GenericService alloc] init];
    });
    return _sharedGenericService;
}

#pragma mark -
#pragma mark Dummy Methods

- (void)generateDummyData
{
    CashFlow *cashFlow = [self createCashFlow];
    cashFlow.name = @"Hello Cash Flow";
    cashFlow.periodType = [NSNumber numberWithInt:CashFlowPeriodTypeMonths];
    
    //First Period Input
    FirstPeriodInputData *firstPeriodInputData = [self createFirstPeriodInputData];
    firstPeriodInputData.sales = [NSNumber numberWithDouble:54054.0];
    firstPeriodInputData.rawMaterials = [NSNumber numberWithDouble:22918.9];
    firstPeriodInputData.oldLoans = [NSNumber numberWithDouble:3589.0];
    firstPeriodInputData.endBalance = [NSNumber numberWithDouble:28589.0];
    firstPeriodInputData.igv = [NSNumber numberWithDouble:0.18];
    
    for (int periodNumber = 0; periodNumber < 14; periodNumber++) {
        Period *period = [self createPeriod];
        PeriodInputData *inputData = [self createPeriodInputData];
        
        period.number = [NSNumber numberWithInt:periodNumber];
        
        if (periodNumber > 0) {
            //General Input
            
            inputData.administrativeExpenses = [NSNumber numberWithDouble:200.0];
            inputData.badDebts = [NSNumber numberWithDouble:0.02];
            inputData.baseRawMaterials = [NSNumber numberWithDouble:4000.0];
            inputData.cashDebtCollections = [NSNumber numberWithDouble:0.2];
            inputData.creditSalesPenalty = [NSNumber numberWithDouble:0.01];
            inputData.debtCollections = [NSNumber numberWithDouble:0.78];
            inputData.dividends = [NSNumber numberWithDouble:80000.0];
            inputData.fixedAssetsExpense = [NSNumber numberWithDouble:30000.0];
            inputData.fixedManpower = [NSNumber numberWithDouble:2400.0];
            inputData.freights = [NSNumber numberWithDouble:0.025];
            inputData.igv = [NSNumber numberWithDouble:18.0];
            inputData.incomeTax = [NSNumber numberWithDouble:0.02];
            inputData.incomeTaxRegularization = [NSNumber numberWithDouble:20000.0];
            inputData.payroll = [NSNumber numberWithDouble:3500.0];
            inputData.rawMaterials = [NSNumber numberWithDouble:0.35];
            inputData.rawMaterialsCashPayment = [NSNumber numberWithDouble:0.20];
            inputData.rawMaterialsPayment = [NSNumber numberWithDouble:0.80];
            inputData.salesExpenses = [NSNumber numberWithDouble:0.05];
            inputData.semestralRewards = [NSNumber numberWithDouble:2.0];
            inputData.socialBenefits = [NSNumber numberWithDouble:0.25667];
            inputData.tea = [NSNumber numberWithDouble:0.098];
            inputData.variableManpower = [NSNumber numberWithDouble:0.08];
            
            //Periodical Input
            
            switch (periodNumber) {
                case 1:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:115500.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 2:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:100100.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 3:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:30000.0];
                    inputData.sales = [NSNumber numberWithDouble:95480.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:30000.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 4:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:110880.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 5:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:136000.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 6:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:118400.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 7:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:135300.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 8:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:98560.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 9:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:75400.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:5182.76];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 10:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:96250.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 11:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:120120.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 12:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:152000.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                case 13:
                    inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
                    inputData.sales = [NSNumber numberWithDouble:126280.00];
                    inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
                    inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
                    inputData.oldLoanExpenses = [NSNumber numberWithDouble:3589.0];
                    break;
                    
                default:
                    break;
            }
            
        }
        
        period.inputData = inputData;
        [cashFlow addPeriodsObject:period];
    }
    
    [self commitChanges];
}

#pragma mark -
#pragma mark Cash Flow Methods

- (NSArray *)getCashFlows
{
    return [self.unitOfWork.cashFlowsRepository getCashFlowsWithPredicate:nil sortDescriptors:nil fetchLimit:NSIntegerMax];
}

- (CashFlow *)createCashFlow
{
    return [self.unitOfWork.cashFlowsRepository createCashFlow];
}

- (void)deleteCashFlow:(CashFlow *)cashFlow
{
    [self.unitOfWork.cashFlowsRepository deleteCashFlow:cashFlow];
}

#pragma mark -
#pragma mark Period Methods

- (Period *)createPeriod
{
    return [self.unitOfWork.periodsRepository createPeriod];
}

#pragma mark -
#pragma mark Period Input Data Methods

- (PeriodInputData *)createPeriodInputData
{
    return [self.unitOfWork.periodInputDataRepository createPeriodInputData];
}

#pragma mark -
#pragma mark First Period Input Data Methods

- (FirstPeriodInputData *)createFirstPeriodInputData
{
    return [self.unitOfWork.firstPeriodInputDataRepository createFirstPeriodInputData];
}

@end
