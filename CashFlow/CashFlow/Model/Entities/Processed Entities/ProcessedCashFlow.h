//
//  ProcessedCashFlow.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/22/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CashFlow;

@interface ProcessedCashFlow : NSObject

- (id)initWithCashFlow:(CashFlow *)cashFlow;

@property (strong, nonatomic, readonly) NSArray *periodCashFlows;

@end
