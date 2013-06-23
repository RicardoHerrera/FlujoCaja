//
//  GenericCashFlowGridDataSource.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/23/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericCashFlowGridDataSource.h"

@interface GenericCashFlowGridDataSource ()

@property (strong, nonatomic) ProcessedCashFlow *processedCashFlow;

@end

@implementation GenericCashFlowGridDataSource

#pragma mark -
#pragma mark Object Lifecycle

- (id)initWithProcessedCashFlow:(ProcessedCashFlow *)processedCashFlow
{
    if (self = [super init]) {
        self.processedCashFlow = processedCashFlow;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSString *)textCellStringWithAmmount:(double)ammount
{
    return (ammount > 0)? [NSString stringWithFormat:@"%.2f", ammount] : (ammount == 0 || ammount == NSIntegerMin)? @"-" : [NSString stringWithFormat:@"(%.2f)", ammount * -1];
}

- (void)prepareEntryCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates
{
    
}

- (void)prepareFirstPeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates
{
    
}

- (void)preparePeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates andPeriodNumber:(NSInteger)periodNumber
{
    
}

@end
