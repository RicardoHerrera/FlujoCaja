//
//  CashFlowsRepository.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "CashFlowsRepository.h"
#import "CashFlow.h"

#define MANAGED_OBJECT_NAME @"CashFlow"

@implementation CashFlowsRepository

- (CashFlow *)createCashFlow
{
    return (CashFlow *)[self createManagedObjectWithName:MANAGED_OBJECT_NAME];
}

- (CashFlow *)getCashFlowWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    return (CashFlow *)[self getManagedObjectWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors];
}

- (NSArray *)getCashFlowsWithPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    return [self getManagedObjectsWithName:MANAGED_OBJECT_NAME withPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:NSUIntegerMax];
}

- (NSDictionary *)getCashFlowSpecificProperties:(NSArray *)expressionDescriptions
{
    return [self getSpecificProperties:expressionDescriptions forManagedObjectNamed:MANAGED_OBJECT_NAME];
}

- (void)deleteCashFlow:(CashFlow *)cashFlow
{
    [self deleteManagedObject:cashFlow];
}

@end
