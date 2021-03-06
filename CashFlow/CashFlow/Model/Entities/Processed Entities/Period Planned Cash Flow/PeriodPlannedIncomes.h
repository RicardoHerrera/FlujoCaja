//
//  PeriodPlannedIncomes.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  PeriodPlannedCashFlow;

@interface PeriodPlannedIncomes : NSObject

@property (strong, nonatomic) PeriodPlannedCashFlow *plannedCashFlow;

@property (readonly, nonatomic) double incomeCollections;
@property (readonly, nonatomic) double newLoans;
@property (readonly, nonatomic) double total;

@end
