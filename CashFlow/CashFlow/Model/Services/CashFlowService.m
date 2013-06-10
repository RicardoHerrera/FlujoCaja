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
    cashFlow.periodType = [NSNumber numberWithInt:CashFlowPeriodTypeMonths];
    
    for (int periodNumber = 0; periodNumber < 14; periodNumber++) {
        Period *period = [self createPeriod];
        PeriodInputData *inputData = [self createPeriodInputData];
        
        period.number = [NSNumber numberWithInt:periodNumber];
        
        //First Period Input
        
        
        
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
        
        inputData.assetsPurchases = [NSNumber numberWithDouble:0.0];
        inputData.sales = [NSNumber numberWithDouble:0.0];
        inputData.loanIncomes = [NSNumber numberWithDouble:0.0];
        inputData.newLoanExpenses = [NSNumber numberWithDouble:0.0];
        inputData.oldLoanExpenses = [NSNumber numberWithDouble:0.0];
        
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

@end
