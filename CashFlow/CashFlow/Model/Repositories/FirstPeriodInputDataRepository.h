//
//  FirstPeriodInputDataRepository.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/9/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericRepository.h"

@class FirstPeriodInputData;

@interface FirstPeriodInputDataRepository : GenericRepository

- (FirstPeriodInputData *)createFirstPeriodInputData;
- (FirstPeriodInputData *)getFirstPeriodInputDataWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)getFirstPeriodInputDatasWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSDictionary *)getFirstPeriodInputDataSpecificProperties:(NSArray *)expressionDescriptions;
- (void)deleteFirstPeriodInputData:(FirstPeriodInputData *)firstPeriodInputData;

@end
