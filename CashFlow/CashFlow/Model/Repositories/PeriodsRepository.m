//
//  PeriodsRepository.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodsRepository.h"
#import "Period.h"

#define MANAGED_OBJECT_NAME @"Period"

@implementation PeriodsRepository

- (Period *)createPeriod
{
    return (Period *)[self createManagedObjectWithName:MANAGED_OBJECT_NAME];
}

- (Period *)getPeriodWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    return (Period *)[self getManagedObjectWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors];
}

- (NSArray *)getPeriodsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    return [self getManagedObjectsWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:NSUIntegerMax];
}

- (NSDictionary *)getPeriodSpecificProperties:(NSArray *)expressionDescriptions
{
    return [self getSpecificProperties:expressionDescriptions forManagedObjectNamed:MANAGED_OBJECT_NAME];
}

- (void)deletePeriod:(Period *)period
{
    [self deleteManagedObject:period];
}

@end
