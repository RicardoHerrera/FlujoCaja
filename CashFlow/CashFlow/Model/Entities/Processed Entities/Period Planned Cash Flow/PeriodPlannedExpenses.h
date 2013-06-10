//
//  PeriodPlannedExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  PeriodPlannedCashFlow;

@interface PeriodPlannedExpenses : NSObject

@property (strong, nonatomic) PeriodPlannedCashFlow *plannedCashFlow;

@property (readonly, nonatomic) double rawMaterialsAndAssetsPurchases;
@property (readonly, nonatomic) double manpower;
@property (readonly, nonatomic) double salaries;
@property (readonly, nonatomic) double administrativeExpenses;
@property (readonly, nonatomic) double salesCommissions;
@property (readonly, nonatomic) double dividends;
@property (readonly, nonatomic) double loans;
@property (readonly, nonatomic) double incomeTaxes;
@property (readonly, nonatomic) double igv;
@property (readonly, nonatomic) double total;

@end
