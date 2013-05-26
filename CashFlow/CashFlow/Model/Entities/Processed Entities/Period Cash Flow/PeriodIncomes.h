//
//  PeriodCashFlowIncomes.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PeriodCashFlow;
@class SalesIncomes;

@interface PeriodIncomes : NSObject

@property (strong, nonatomic) PeriodCashFlow *periodCashFlow;
@property (strong, nonatomic) SalesIncomes *salesIncomes;

@property (readonly, nonatomic) double debtCollections;
@property (readonly, nonatomic) double loans;
@property (readonly, nonatomic) double salesIGV;

@end
