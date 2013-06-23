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

@property (readonly, nonatomic) NSInteger periodNumber;
@property (readonly, strong, nonatomic) NSDate *date;
@property (readonly, strong, nonatomic) NSString *dateString;
@property (readonly, strong, nonatomic) PeriodIncomes *incomes;
@property (readonly, strong, nonatomic) PeriodExpenses *expenses;

@property (strong, nonatomic) PeriodInputData *inputData;
@property (strong, nonatomic) PeriodCashFlow *lastPeriodCashFlow;

@end
