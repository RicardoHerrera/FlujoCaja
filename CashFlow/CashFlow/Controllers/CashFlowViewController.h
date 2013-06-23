//
//  CashFlowViewController.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/8/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CashFlow.h"

@interface CashFlowViewController : UIViewController<SDataGridDataSource>

@property (strong, nonatomic) CashFlow *cashFlow;

@end
