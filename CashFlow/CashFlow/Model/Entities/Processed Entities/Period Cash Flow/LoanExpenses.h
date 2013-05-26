//
//  LoanExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodExpenses;

@interface LoanExpenses : NSObject

@property (strong, nonatomic) PeriodExpenses *periodExpenses;

@property (readonly, nonatomic) double old;
@property (readonly, nonatomic) double new;

@end
