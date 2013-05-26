//
//  PeriodCashFlowManpowerExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodExpenses;

@interface ManpowerExpenses : NSObject

@property (strong, nonatomic) PeriodExpenses *periodExpenses;

@property (readonly, nonatomic) double fixed;
@property (readonly, nonatomic) double variable;
@property (readonly, nonatomic) double total;

@end
