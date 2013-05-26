//
//  PeriodInputsRepository.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PeriodInputDataRepository.h"
#import "PeriodInputData.h"

#define MANAGED_OBJECT_NAME @"PeriodInputData"

@implementation PeriodInputDataRepository

- (PeriodInputData *)createPeriodInputData
{
    return (PeriodInputData *)[self createManagedObjectWithName:MANAGED_OBJECT_NAME];
}

- (PeriodInputData *)getPeriodInputDataWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    return (PeriodInputData *)[self getManagedObjectWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors];
}

- (NSArray *)getPeriodInputDatasWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    return [self getManagedObjectsWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:NSUIntegerMax];
}

- (NSDictionary *)getPeriodInputDataSpecificProperties:(NSArray *)expressionDescriptions
{
    return [self getSpecificProperties:expressionDescriptions forManagedObjectNamed:MANAGED_OBJECT_NAME];
}

- (void)deletePeriodInputData:(PeriodInputData *)periodInputData
{
    [self deleteManagedObject:periodInputData];
}

@end

