//
//  FirstPeriodInputData.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/9/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CashFlow;

@interface FirstPeriodInputData : NSManagedObject

@property (nonatomic, retain) NSNumber * sales;
@property (nonatomic, retain) NSNumber * rawMaterials;
@property (nonatomic, retain) NSNumber * oldLoans;
@property (nonatomic, retain) NSNumber * endBalance;
@property (nonatomic, retain) NSNumber * igv;
@property (nonatomic, retain) CashFlow *cashFlow;

@end
