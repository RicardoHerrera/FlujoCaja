//
//  GenericCashFlowGridDataSource.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/23/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProcessedCashFlow;

@interface GenericCashFlowGridDataSource : NSObject

@property (readonly, strong, nonatomic) ProcessedCashFlow *processedCashFlow;

- (id)initWithProcessedCashFlow:(ProcessedCashFlow *)processedCashFlow;

- (NSString *)textCellStringWithAmmount:(double)ammount;

- (void)prepareEntryCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates;
- (void)prepareFirstPeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates;
- (void)preparePeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates andPeriodNumber:(NSInteger)periodNumber;

@end
