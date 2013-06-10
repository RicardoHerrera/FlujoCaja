//
//  Period.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/9/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CashFlow, PeriodInputData;

@interface Period : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) CashFlow *cashFlow;
@property (nonatomic, retain) PeriodInputData *inputData;

@end
