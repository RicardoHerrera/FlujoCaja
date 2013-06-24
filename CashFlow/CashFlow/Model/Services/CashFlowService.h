//
//  CashFlowService.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericService.h"

@class CashFlow;

@interface CashFlowService : GenericService

+ (CashFlowService *)sharedService;

- (void)generateDummyData;

- (CashFlow *)getCashFlowWithPredicate:(NSPredicate *)predicate;
- (NSArray *)getCashFlows;
- (CashFlow *)createCashFlow;
- (void)deleteCashFlow:(CashFlow *)cashFlow;

- (Period *)createPeriod;
- (void)deletePeriod:(Period *)period;

- (PeriodInputData *)createPeriodInputData;
- (void)deletePeriodInputData:(PeriodInputData *)periodInputData;

- (FirstPeriodInputData *)createFirstPeriodInputData;

- (NSArray *)getPeriodCashFlowsForCashFlow:(CashFlow *)cashFlow;


@end
