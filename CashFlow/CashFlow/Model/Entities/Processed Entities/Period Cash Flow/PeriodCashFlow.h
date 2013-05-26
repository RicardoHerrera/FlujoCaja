//
//  PeriodCashFlow.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodInputData;
@class PeriodIncomes;
@class PeriodExpenses;

@interface PeriodCashFlow : NSObject

@property (strong, nonatomic) PeriodInputData *inputData;
@property (strong, nonatomic) PeriodIncomes *incomes;
@property (strong, nonatomic) PeriodExpenses *expenses;

@end
