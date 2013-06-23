//
//  ProcessedCashFlow.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/22/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "ProcessedCashFlow.h"
#import "CashFlow.h"
#import "Period.h"
#import "PeriodCashFlow.h"
#import "PeriodInputData.h"
#import "PeriodPlannedCashFlow.h"

@interface ProcessedCashFlow()

@property (strong, nonatomic) NSArray *periodCashFlows;
@property (strong, nonatomic) NSArray *periodPlannedCashFlows;

@end

@implementation ProcessedCashFlow

#pragma mark -
#pragma mark Object Lifecycle

- (id)initWithCashFlow:(CashFlow *)cashFlow
{
    if (self = [super init]) {
        
        NSMutableArray *periodCashFlows = [NSMutableArray array];
        NSArray *sortedPeriods = [[cashFlow.periods allObjects] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES]]];
        
        PeriodCashFlow *lastPeriodCashFlow = nil;
        
        for (Period *period in sortedPeriods) {
            
            PeriodCashFlow *periodCashFlow = [[PeriodCashFlow alloc] init];
        
            PeriodInputData *inputData = period.inputData;
            
            periodCashFlow.inputData = inputData;
            periodCashFlow.lastPeriodCashFlow = lastPeriodCashFlow;
            
            lastPeriodCashFlow = periodCashFlow;
            
            [periodCashFlows addObject:periodCashFlow];
        }
        
        self.periodCashFlows = [NSArray arrayWithArray:periodCashFlows];
        
        NSMutableArray *periodPlannedCashFlows = [NSMutableArray array];
        
        PeriodPlannedCashFlow *lastPlannedCashFlow = nil;
        for (PeriodCashFlow *periodCashFlow in self.periodCashFlows) {
            
            PeriodPlannedCashFlow *periodPlannedCashFlow = [[PeriodPlannedCashFlow alloc] init];
            periodPlannedCashFlow.cashFlow = periodCashFlow;
            periodPlannedCashFlow.lastPlannedCashFlow = lastPlannedCashFlow;
            
            lastPlannedCashFlow = periodPlannedCashFlow;
            
            [periodPlannedCashFlows addObject:periodPlannedCashFlow];
        }
        
        self.periodPlannedCashFlows = [NSArray arrayWithArray:periodPlannedCashFlows];
    }
    
    return self;
}

#pragma mark -
#pragma mark Custom Accessors

- (NSArray *)periodCashFlows
{
    if (!_periodCashFlows) {
        self.periodCashFlows = [NSArray array];
    }
    
    return _periodCashFlows;
}

- (NSArray *)periodPlannedCashFlows
{
    if (!_periodPlannedCashFlows) {
        self.periodPlannedCashFlows = [NSArray array];
    }
    
    return _periodPlannedCashFlows;
}

@end
