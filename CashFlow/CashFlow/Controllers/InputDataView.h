//
//  InputDataView.h
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 23/06/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PeriodCashFlow.h"

@interface InputDataView : UIViewController{
    
}

@property (strong, nonatomic) IBOutlet UITextField *administrativeExpenses;

@property (strong, nonatomic) IBOutlet UITextField *assetsPurchases;
@property (strong, nonatomic) IBOutlet UITextField *txtBadDebt;
@property (strong, nonatomic) IBOutlet UITextField *txtBaseRawMaterial;
@property (strong, nonatomic) IBOutlet UITextField *txtCashDebtCollections;
@property (strong, nonatomic) IBOutlet UITextField *txtCreditSalesPenalty;
@property (strong, nonatomic) IBOutlet UITextField *txtDebtCollections;
@property (strong, nonatomic) IBOutlet UITextField *txtDividends;
@property (strong, nonatomic) IBOutlet UITextField *txtFixedAssetsExpense;
@property (strong, nonatomic) IBOutlet UITextField *txtFixedManPower;
@property (strong, nonatomic) IBOutlet UITextField *txtFreights;
@property (strong, nonatomic) IBOutlet UITextField *txtIgv;
@property (strong, nonatomic) IBOutlet UITextField *txtIncomeTaxes;
@property (strong, nonatomic) IBOutlet UITextField *txtIncomeTaxRegularization;
@property (strong, nonatomic) IBOutlet UITextField *txtLoanIncomes;
@property (strong, nonatomic) IBOutlet UITextField *txtNewLoanExpenses;
@property (strong, nonatomic) IBOutlet UITextField *txtOldLoanExpenses;
@property (strong, nonatomic) IBOutlet UITextField *txtPayroll;
@property (strong, nonatomic) IBOutlet UITextField *txtRawMaterials;
@property (strong, nonatomic) IBOutlet UITextField *txtRawMaterialsCashPayment;
@property (strong, nonatomic) IBOutlet UITextField *txtRawMaterialsPayment;
@property (strong, nonatomic) IBOutlet UITextField *txtSales;
@property (strong, nonatomic) IBOutlet UITextField *txtSalesExpenses;
@property (strong, nonatomic) IBOutlet UITextField *txtSemestralReward;
@property (strong, nonatomic) IBOutlet UITextField *txtSocialBenefit;
@property (strong, nonatomic) IBOutlet UITextField *txtTea;
@property (strong, nonatomic) IBOutlet UITextField *txtVariableManpower;

@property(strong, nonatomic) PeriodCashFlow *period;

- (IBAction)onTapHelpMessage:(id)sender;
- (IBAction)onTapCancel:(id)sender;
- (IBAction)onTapDone:(id)sender;

- (void)fullFields;

@end
