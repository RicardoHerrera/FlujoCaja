//
//  FirstPeriodInputDataRepository.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/9/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "FirstPeriodInputDataRepository.h"
#import "FirstPeriodInputData.h"

#define MANAGED_OBJECT_NAME @"FirstPeriodInputData"

@implementation FirstPeriodInputDataRepository

- (FirstPeriodInputData *)createFirstPeriodInputData
{
    return (FirstPeriodInputData *)[self createManagedObjectWithName:MANAGED_OBJECT_NAME];
}

- (FirstPeriodInputData *)getFirstPeriodInputDataWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    return (FirstPeriodInputData *)[self getManagedObjectWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors];
}

- (NSArray *)getFirstPeriodInputDatasWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    return [self getManagedObjectsWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:NSUIntegerMax];
}

- (NSDictionary *)getFirstPeriodInputDataSpecificProperties:(NSArray *)expressionDescriptions
{
    return [self getSpecificProperties:expressionDescriptions forManagedObjectNamed:MANAGED_OBJECT_NAME];
}

- (void)deleteFirstPeriodInputData:(FirstPeriodInputData *)firstPeriodInputData
{
    [self deleteManagedObject:firstPeriodInputData];
}

@end
