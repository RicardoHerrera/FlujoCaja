//
//  FirstInputDataView.h
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 23/06/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FirstPeriodInputData.h"

@interface FirstInputDataView : UIViewController{
    
    
}

@property (strong, nonatomic) IBOutlet UITextField *txtFinalBalance;
@property (strong, nonatomic) IBOutlet UITextField *txtIgv;
@property (strong, nonatomic) IBOutlet UITextField *txtOldLoan;
@property (strong, nonatomic) IBOutlet UITextField *txtRawMaterial;
@property (strong, nonatomic) IBOutlet UITextField *txtSales;

@property(strong, nonatomic) FirstPeriodInputData *period;
@property(strong, nonatomic) NSString *flowName;
@property(nonatomic) int state; //0 = modify
                                //1 = new

- (IBAction)onTapCancel:(id)sender;
- (IBAction)onTapDone:(id)sender;

- (IBAction)onTapHelpMessage:(id)sender;

- (void)fullFields;


@end
