//
//  PeriodInputData.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Period;

@interface PeriodInputData : NSManagedObject

@property (nonatomic, retain) NSNumber * badDebts;
@property (nonatomic, retain) NSNumber * baseRawMaterials;
@property (nonatomic, retain) NSNumber * cashDebtCollections;
@property (nonatomic, retain) NSNumber * creditSalesPenalty;
@property (nonatomic, retain) NSNumber * debtCollections;
@property (nonatomic, retain) NSNumber * dividends;
@property (nonatomic, retain) NSNumber * fixedAssetsExpense;
@property (nonatomic, retain) NSNumber * fixedManpower;
@property (nonatomic, retain) NSNumber * freights;
@property (nonatomic, retain) NSNumber * igv;
@property (nonatomic, retain) NSNumber * incomeTax;
@property (nonatomic, retain) NSNumber * incomeTaxRegularization;
@property (nonatomic, retain) NSNumber * payroll;
@property (nonatomic, retain) NSNumber * rawMaterials;
@property (nonatomic, retain) NSNumber * rawMaterialsCashPayment;
@property (nonatomic, retain) NSNumber * rawMaterialsPayment;
@property (nonatomic, retain) NSNumber * sales;
@property (nonatomic, retain) NSNumber * semestralRewards;
@property (nonatomic, retain) NSNumber * tea;
@property (nonatomic, retain) NSNumber * variableManpower;
@property (nonatomic, retain) NSNumber * oldLoanExpenses;
@property (nonatomic, retain) NSNumber * newLoanExpenses;
@property (nonatomic, retain) NSNumber * loanIncomes;
@property (nonatomic, retain) NSNumber * assetsPurchases;
@property (nonatomic, retain) NSNumber * administrativeExpenses;
@property (nonatomic, retain) NSNumber * socialBenefits;
@property (nonatomic, retain) NSNumber * salesExpenses;
@property (nonatomic, retain) Period *period;

@end
