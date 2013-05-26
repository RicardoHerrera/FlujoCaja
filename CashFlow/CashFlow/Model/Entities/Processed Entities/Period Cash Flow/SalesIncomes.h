//
//  PeriodCashFlowIncomesSales.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodIncomes;

@interface SalesIncomes : NSObject

@property (strong, nonatomic) PeriodIncomes *periodIncomes;

@property (readonly, nonatomic) double sales;
@property (readonly, nonatomic) double cash;
@property (readonly, nonatomic) double credit;
@property (readonly, nonatomic) double penalty;
@property (readonly, nonatomic) double badDebts;

@end
