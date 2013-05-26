//
//  TaxesExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodExpenses;

@interface IncomeTaxesExpenses : NSObject

@property (strong, nonatomic) PeriodExpenses *periodExpenses;

@property (readonly, nonatomic) double tax;
@property (readonly, nonatomic) double advancePayment;
@property (readonly, nonatomic) double regularization;
@property (readonly, nonatomic) double total;

@end
