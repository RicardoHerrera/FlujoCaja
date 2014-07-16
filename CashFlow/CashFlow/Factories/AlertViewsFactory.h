//
//  AlertViewsFactory.h
//  CashFlow
//
//  Created by Alex Gutierrez on 5/25/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved..
//

#import <Foundation/Foundation.h>

@interface AlertViewsFactory : NSObject

+ (id)sharedFactory;

- (UIAlertView *)createAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
