//
//  CashFlow.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Period;

@interface CashFlow : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * periodType;
@property (nonatomic, retain) NSSet *periods;
@end

@interface CashFlow (CoreDataGeneratedAccessors)

- (void)addPeriodsObject:(Period *)value;
- (void)removePeriodsObject:(Period *)value;
- (void)addPeriods:(NSSet *)values;
- (void)removePeriods:(NSSet *)values;

@end
