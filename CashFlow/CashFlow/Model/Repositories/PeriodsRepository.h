//
//  PeriodsRepository.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericRepository.h"

@class Period;

@interface PeriodsRepository : GenericRepository

- (Period *)createPeriod;
- (Period *)getPeriodWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)getPeriodsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSDictionary *)getPeriodSpecificProperties:(NSArray *)expressionDescriptions;
- (void)deletePeriod:(Period *)period;

@end
