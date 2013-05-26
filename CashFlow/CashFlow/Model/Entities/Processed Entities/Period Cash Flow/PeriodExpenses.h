//
//  PeriodCashFlowExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodCashFlow;
@class RawMaterialExpenses;
@class ManpowerExpenses;
@class SalaryExpenses;
@class IncomeTaxesExpenses;
@class LoanExpenses;

@interface PeriodExpenses : NSObject

@property (strong, nonatomic) PeriodCashFlow *periodCashFlow;
@property (strong, nonatomic) RawMaterialExpenses *rawMaterialExpenses;
@property (strong, nonatomic) ManpowerExpenses *manpowerExpenses;
@property (strong, nonatomic) SalaryExpenses *salaryExpenses;
@property (strong, nonatomic) IncomeTaxesExpenses *incomeTaxesExpenses;
@property (strong, nonatomic) LoanExpenses *loanExpenses;

@property (readonly, nonatomic) double assetsPurchases;
@property (readonly, nonatomic) double taxCredit;
@property (readonly, nonatomic) double administrativeExpenses;
@property (readonly, nonatomic) double salesCommissions;
@property (readonly, nonatomic) double dividends;

@end
