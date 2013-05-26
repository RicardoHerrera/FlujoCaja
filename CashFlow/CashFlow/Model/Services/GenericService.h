//
//  GenericService.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UnitOfWork.h"

@interface GenericService : NSObject

@property (readonly, strong, nonatomic) UnitOfWork *unitOfWork;

+ (GenericService *)sharedService;

- (void)commitChanges;
- (void)rollback;

@end
