//
//  SalaryExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "SalaryExpenses.h"
#import "PeriodExpenses.h"
#import "PeriodCashFlow.h"
#import "PeriodIncomes.h"
#import "PeriodInputData.h"
#import "Period.h"

@implementation SalaryExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.salaryExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)payroll
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double payroll = (inputData.payroll)? inputData.payroll.doubleValue : 0;
    NSInteger month = (periodCashFlow.date)? periodCashFlow.date.month : 0;
    
    return (month == 7 || month == 12)? payroll * 2 : payroll;
}

- (double)socialBenefits
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    PeriodInputData *inputData = periodCashFlow.inputData;
    
    double socialBenefitsPercentage = (inputData.socialBenefits)? inputData.socialBenefits.doubleValue : 0;
    
    return self.payroll * socialBenefitsPercentage;
}

- (double)total
{
    PeriodCashFlow *periodCashFlow = self.periodExpenses.periodCashFlow;
    if (periodCashFlow.periodNumber == 0) {
        return NSIntegerMin;
    }
    
    return self.payroll + self.socialBenefits;
}

@end
