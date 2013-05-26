//
//  GenericService.m
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "GenericService.h"

@implementation GenericService

#pragma mark -
#pragma mark Class Methods

+ (GenericService *)sharedService
{
    static GenericService *_sharedGenericService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGenericService = [[GenericService alloc] init];
    });
    return _sharedGenericService;
}

#pragma mark -
#pragma mark Custom Accessors

- (UnitOfWork *)unitOfWork
{
    return [UnitOfWork sharedUnitOfWork];
}

#pragma mark -
#pragma mark Public Methods

- (void)commitChanges
{
    [self.unitOfWork commitChanges];
}

- (void)rollback
{
    [self.unitOfWork rollback];
}


@end
