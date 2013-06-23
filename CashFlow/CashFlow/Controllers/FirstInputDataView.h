//
//  FirstInputDataView.h
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 23/06/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstInputDataView : UIViewController{
    
    
}

@property (strong, nonatomic) IBOutlet UITextField *txtFinalBalance;
@property (strong, nonatomic) IBOutlet UITextField *txtIgv;
@property (strong, nonatomic) IBOutlet UITextField *txtOldLoan;
@property (strong, nonatomic) IBOutlet UITextField *txtRawMaterial;
@property (strong, nonatomic) IBOutlet UITextField *txtSales;

- (IBAction)onTapCancel:(id)sender;
- (IBAction)onTapDone:(id)sender;

- (IBAction)onTapHelpMessage:(id)sender;


@end
