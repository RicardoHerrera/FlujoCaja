//
//  PeriodCashFlowRawMaterialExpenses.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "RawMaterialExpenses.h"
#import "PeriodExpenses.h"

@implementation RawMaterialExpenses

#pragma mark -
#pragma mark Custom Accessors

- (PeriodExpenses *)periodExpenses
{
    if (!_periodExpenses) {
        self.periodExpenses = [[PeriodExpenses alloc] init];
        self.periodExpenses.rawMaterialExpenses = self;
    }
    
    return _periodExpenses;
}

#pragma mark -
#pragma mark Calculated Attributes

- (double)rawMaterials
{
    return 0.0;
}

- (double)cash
{
    return 0.0;
}

- (double)credit
{
    return 0.0;
}

- (double)total
{
    return 0.0;
}

@end
