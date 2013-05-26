//
//  CashFlowsRepository.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericRepository.h"

@class CashFlow;

@interface CashFlowsRepository : GenericRepository

- (CashFlow *)createCashFlow;
- (CashFlow *)getCashFlowWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)getCashFlowsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSDictionary *)getCashFlowSpecificProperties:(NSArray *)expressionDescriptions;
- (void)deleteCashFlow:(CashFlow *)cashFlow;

@end
