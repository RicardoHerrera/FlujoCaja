//
//  UnitOfWork.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeriodsRepository.h"
#import "CashFlowsRepository.h"
#import "PeriodInputDataRepository.h"
#import "FirstPeriodInputDataRepository.h"

@interface UnitOfWork : NSObject

@property (readonly, strong, nonatomic) PeriodsRepository *periodsRepository;
@property (readonly, strong, nonatomic) CashFlowsRepository *cashFlowsRepository;
@property (readonly, strong, nonatomic) PeriodInputDataRepository *periodInputDataRepository;
@property (readonly, strong, nonatomic) FirstPeriodInputDataRepository *firstPeriodInputDataRepository;

+ (id)sharedUnitOfWork;

- (void)commitChanges;
- (void)rollback;

@end
