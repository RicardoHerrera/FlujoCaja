//
//  PeriodCashFlow.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "PeriodExpenses.h"
#import "PeriodInputData.h"
#import "Period.h"
#import "CashFlow.h"
#import "CashFlowPeriodType.h"

@interface PeriodCashFlow ()

@property (strong, nonatomic) PeriodIncomes *incomes;
@property (strong, nonatomic) PeriodExpenses *expenses;

@end

@implementation PeriodCashFlow

#pragma mark -
#pragma mark Custom Accessors

- (NSDate *)date
{
    Period *period = self.inputData.period;
    CashFlow *cashFlow = period.cashFlow;
    NSDate *date = cashFlow.startDate;
    NSInteger periodNumber = period.number.integerValue;
    
    if (periodNumber != 1) {
        
        NSDateComponents* dateComponents = [[NSDateComponents alloc]init];
        NSCalendar* calendar = [NSCalendar currentCalendar];
        
        if (cashFlow.periodType.integerValue == CashFlowPeriodTypeMonths) {
            dateComponents.month = 1;
        }
        
        if (period.number.integerValue == 0) {
            dateComponents.month *= -1;
            dateComponents.year *= -1;
            dateComponents.day *= -1;
        }
    
        date = [calendar dateByAddingComponents:dateComponents toDate:self.lastPeriodCashFlow.date options:0];
    }
    
    return date;
}

- (NSInteger)periodNumber
{
    Period *period = self.inputData.period;
    
    return period.number? period.number.integerValue : 0;
}

- (PeriodIncomes *)incomes
{
    if (!_incomes) {
        self.incomes = [[PeriodIncomes alloc] init];
        self.incomes.periodCashFlow = self;
    }
    
    return _incomes;
}

- (PeriodExpenses *)expenses
{
    if (!_expenses) {
        self.expenses = [[PeriodExpenses alloc] init];
        self.expenses.periodCashFlow = self;
    }
    
    return _expenses;
}

@end
