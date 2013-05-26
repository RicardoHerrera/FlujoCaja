//
//  PeriodPlannedCashFlowSummary.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  PeriodPlannedCashFlow;

@interface PeriodPlannedCashFlowSummary : NSObject

@property (strong, nonatomic) PeriodPlannedCashFlow *plannedCashFlow;

@property (readonly, nonatomic) double netIncomesExpenses;
@property (readonly, nonatomic) double startBalance;
@property (readonly, nonatomic) double endBalance;

@end
