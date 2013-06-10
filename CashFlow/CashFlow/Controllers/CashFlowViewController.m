//
//  CashFlowViewController.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/8/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "CashFlowViewController.h"


@interface CashFlowViewController ()

@property (strong, nonatomic) ShinobiDataGrid *grid;

@end

@implementation CashFlowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	self.grid.licenseKey = kLicenseKey;
    
    [self.view addSubview:self.grid];
}

@end
