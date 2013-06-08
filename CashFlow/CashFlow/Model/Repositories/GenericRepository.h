//
//  GenericRepository.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenericRepository : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *defaultContext;

- (id)initWithDefaultContext:(NSManagedObjectContext *)defaultContext;

- (void)deleteManagedObject:(NSManagedObject *)managedObject;
- (NSManagedObject *)createManagedObjectWithName:(NSString *)managedObjectName;
- (NSManagedObject *)getManagedObjectWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)getManagedObjectsWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSUInteger)countManagedObjectsWithName:(NSString *)managedObjectName withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)fetchLimit;
- (NSDictionary *)getSpecificProperties:(NSArray *)expressionDescriptions forManagedObjectNamed:(NSString *)managedObjectName;

@end
