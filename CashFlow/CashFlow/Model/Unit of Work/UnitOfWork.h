//
//  UnitOfWork.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnitOfWork : NSObject

+ (id)sharedUnitOfWork;

- (void)commitChanges;
- (void)rollback;

@end
