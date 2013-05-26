//
//  Period.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/26/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CashFlow, PeriodInputData;

@interface Period : NSManagedObject

@property (nonatomic, retain) NSNumber * bimester;
@property (nonatomic, retain) NSNumber * month;
@property (nonatomic, retain) NSNumber * quarter;
@property (nonatomic, retain) NSNumber * semester;
@property (nonatomic, retain) NSNumber * week;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) CashFlow *cashFlow;
@property (nonatomic, retain) PeriodInputData *inputData;

@end
