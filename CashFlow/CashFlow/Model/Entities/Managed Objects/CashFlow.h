//
//  CashFlow.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/9/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Period, FirstPeriodInputData;

@interface CashFlow : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * periodType;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSSet *periods;
@property (nonatomic, retain) FirstPeriodInputData *firstPeriodInputData;
@end

@interface CashFlow (CoreDataGeneratedAccessors)

- (void)addPeriodsObject:(Period *)value;
- (void)removePeriodsObject:(Period *)value;
- (void)addPeriods:(NSSet *)values;
- (void)removePeriods:(NSSet *)values;

@end
