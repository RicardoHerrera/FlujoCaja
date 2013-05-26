//
//  PeriodCashFlowRawMaterialExpenses.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodExpenses;

@interface RawMaterialExpenses : NSObject

@property (strong, nonatomic) PeriodExpenses *periodExpenses;

@property (readonly, nonatomic) double rawMaterials;
@property (readonly, nonatomic) double cash;
@property (readonly, nonatomic) double credit;
@property (readonly, nonatomic) double total;

@end
