//
//  PeriodInputsRepository.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericRepository.h"

@class PeriodInputData;

@interface PeriodInputDataRepository : GenericRepository

- (PeriodInputData *)createPeriodInputData;
- (PeriodInputData *)getPeriodInputDataWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)getPeriodInputDatasWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSDictionary *)getPeriodInputDataSpecificProperties:(NSArray *)expressionDescriptions;
- (void)deletePeriodInputData:(PeriodInputData *)periodInputData;

@end
