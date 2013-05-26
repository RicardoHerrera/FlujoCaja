//
//  GenericRepository.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericRepository.h"

@interface GenericRepository ()

@property (strong, nonatomic) NSManagedObjectContext *defaultContext;

@end
@implementation GenericRepository

#pragma mark -
#pragma mark Object Lifecycle

- (id)initWithDefaultContext:(NSManagedObjectContext *)defaultContext
{
    if (self = [super init]) {
        self.defaultContext = defaultContext;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)deleteManagedObject:(NSManagedObject *)managedObject
{
    [self.defaultContext deleteObject:managedObject];
}

- (NSManagedObject *)createManagedObjectWithName:(NSString *)managedObjectName
{
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:managedObjectName inManagedObjectContext:self.defaultContext];
    return managedObject;
}

- (NSManagedObject *)getManagedObjectWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    NSArray *fetchedObjects = [self getManagedObjectsWithName:managedObjectName withPredicate:predicate sortDescriptors:sortDescriptors fetchLimit:1];
    
    return (fetchedObjects)? [fetchedObjects lastObject] : nil;
}

- (NSArray *)getManagedObjectsWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:managedObjectName inManagedObjectContext:self.defaultContext];
    request.sortDescriptors = sortDescriptors;
    request.predicate = predicate;
    request.fetchLimit = fetchLimit;
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.defaultContext executeFetchRequest:request error:&error];
    if (error) {
        return nil;
    }
    
    return fetchedObjects;
}

- (NSUInteger)countManagedObjectsWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:managedObjectName inManagedObjectContext:self.defaultContext];
    request.sortDescriptors = sortDescriptors;
    request.predicate = predicate;
    request.fetchLimit = fetchLimit;
    
    NSError *error = nil;
    NSUInteger count = [self.defaultContext countForFetchRequest:request error:&error];
    if (error) {
        return 0;
    }
    
    return count;
}

- (NSDictionary *)getSpecificProperties:(NSArray *)expressionDescriptions forManagedObjectNamed:(NSString *)managedObjectName
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:managedObjectName inManagedObjectContext:self.defaultContext];
    request.resultType = NSDictionaryResultType;
    request.propertiesToFetch = expressionDescriptions;
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.defaultContext executeFetchRequest:request error:&error];
    if (fetchedObjects && !error) {
        return fetchedObjects[0];
    }
    
    return nil;
}

@end
