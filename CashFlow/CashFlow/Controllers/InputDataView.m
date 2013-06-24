//
//  InputDataView.m
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 23/06/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "InputDataView.h"
#import "AlertViewsFactory.h"
#import "PeriodInputData.h"

@interface InputDataView ()

@end

@implementation InputDataView

@synthesize period;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self fullFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapHelpMessage:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Messages" ofType:@"plist"];
    
    NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *messages = [root objectForKey:@"PeriodInputDataMessages"];
    
    NSLog(@"message: %@", [messages objectAtIndex:[sender tag]]);
    [[[AlertViewsFactory sharedFactory] createAlertViewWithTitle:@"Cash Flow" andMessage:[messages objectAtIndex:[sender tag]]] show];
}

#pragma mark Interface's Methods
- (void)fullFields{
    
    self.txtBadDebt.text = [self transformNsNumberToNsstring:period.inputData.badDebts];
    self.txtBaseRawMaterial.text = [self transformNsNumberToNsstring:period.inputData.baseRawMaterials];
    self.txtCashDebtCollections.text = [self transformNsNumberToNsstring:period.inputData.cashDebtCollections];
    self.txtCreditSalesPenalty.text = [self transformNsNumberToNsstring:period.inputData.creditSalesPenalty];
    self.txtDebtCollections.text = [self transformNsNumberToNsstring:period.inputData.debtCollections];
    self.txtDividends.text = [self transformNsNumberToNsstring:period.inputData.dividends];
    self.txtFixedAssetsExpense.text = [self transformNsNumberToNsstring:period.inputData.fixedAssetsExpense];
    self.txtFixedManPower.text = [self transformNsNumberToNsstring:period.inputData.fixedManpower];
    self.txtFreights.text = [self transformNsNumberToNsstring:period.inputData.freights];
    self.txtIgv.text = [self transformNsNumberToNsstring:period.inputData.badDebts];
    self.txtIncomeTaxes.text = [self transformNsNumberToNsstring:period.inputData.incomeTax];
    self.txtIncomeTaxRegularization.text = [self transformNsNumberToNsstring:period.inputData.incomeTaxRegularization];
    self.txtLoanIncomes.text = [self transformNsNumberToNsstring:period.inputData.loanIncomes];
    self.txtNewLoanExpenses.text = [self transformNsNumberToNsstring:period.inputData.newLoanExpenses];
    self.txtOldLoanExpenses.text = [self transformNsNumberToNsstring:period.inputData.oldLoanExpenses];
    self.txtPayroll.text = [self transformNsNumberToNsstring:period.inputData.payroll];
    self.txtRawMaterials.text = [self transformNsNumberToNsstring:period.inputData.rawMaterials];
    self.txtRawMaterialsCashPayment.text = [self transformNsNumberToNsstring:period.inputData.rawMaterialsCashPayment];
    self.txtRawMaterialsPayment.text = [self transformNsNumberToNsstring:period.inputData.rawMaterialsPayment];
    self.txtSales.text = [self transformNsNumberToNsstring:period.inputData.sales];
    self.txtSalesExpenses.text = [self transformNsNumberToNsstring:period.inputData.salesExpenses];
    self.txtSemestralReward.text = [self transformNsNumberToNsstring:period.inputData.semestralRewards];
    self.txtSocialBenefit.text = [self transformNsNumberToNsstring:period.inputData.socialBenefits];
    self.txtTea.text = [self transformNsNumberToNsstring:period.inputData.tea];
    self.txtVariableManpower.text = [self transformNsNumberToNsstring:period.inputData.variableManpower];
    self.assetsPurchases.text = [self transformNsNumberToNsstring:period.inputData.assetsPurchases];
    self.administrativeExpenses.text = [self transformNsNumberToNsstring:period.inputData.administrativeExpenses];
    
}

- (NSString *)transformNsNumberToNsstring:(NSNumber *)theNumber{
    
    NSString *str = [NSString stringWithFormat:@"%.2f", [theNumber floatValue]];
    
    return  str;
    
}

#pragma mark buttons actions
- (IBAction)onTapCancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:Nil];
}

- (IBAction)onTapDone:(id)sender {
    
    //Verify fields
    //Save Data
    
    [self onTapCancel:Nil];
    
}
@end
