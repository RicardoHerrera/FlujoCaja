//
//  PeriodPlannedCashFlow.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodCashFlow;
@class PeriodPlannedIncomes;
@class PeriodPlannedExpenses;
@class PeriodPlannedCashFlowSummary;

@interface PeriodPlannedCashFlow : NSObject

@property (strong, nonatomic) PeriodCashFlow *cashFlow;

@property (strong, nonatomic) PeriodPlannedIncomes *incomes;
@property (strong, nonatomic) PeriodPlannedExpenses *expenses;
@property (strong, nonatomic) PeriodPlannedCashFlowSummary *cashFlowSummary;

@property (strong, nonatomic) PeriodPlannedCashFlow *lastPlannedCashFlow;

@end
