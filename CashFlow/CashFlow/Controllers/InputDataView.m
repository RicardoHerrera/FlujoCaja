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
#import "GenericService.h"
#import "CashFlowService.h"

@interface InputDataView ()

@end

@implementation InputDataView

@synthesize period;
@synthesize isLastPeriod;

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

- (NSNumber *)transformNsstrinToNsnumber:(NSString *)theString{
    
    if ([@"" isEqualToString:theString]) {
        theString = @"0.0";
    }
    
    NSNumber *number = [NSNumber numberWithFloat:[theString floatValue]];
    
    return number;
}

#pragma mark buttons actions
- (IBAction)onTapCancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:Nil];
}

- (IBAction)onTapDone:(id)sender {
    
    //Verify fields
    
    //Save Data
    period.inputData.badDebts = [self transformNsstrinToNsnumber:self.txtBadDebt.text];
    period.inputData.baseRawMaterials = [self transformNsstrinToNsnumber:self.txtRawMaterials.text];
    period.inputData.cashDebtCollections = [self transformNsstrinToNsnumber:self.txtCashDebtCollections.text];
    period.inputData.creditSalesPenalty = [self transformNsstrinToNsnumber:self.txtCreditSalesPenalty.text];
    period.inputData.debtCollections = [self transformNsstrinToNsnumber:self.txtDebtCollections.text];
    period.inputData.dividends = [self transformNsstrinToNsnumber:self.txtDividends.text];
    period.inputData.fixedAssetsExpense = [self transformNsstrinToNsnumber:self.txtFixedAssetsExpense.text];
    period.inputData.fixedManpower = [self transformNsstrinToNsnumber:self.txtFixedManPower.text];
    period.inputData.freights = [self transformNsstrinToNsnumber:self.txtFreights.text];
    period.inputData.badDebts = [self transformNsstrinToNsnumber:self.txtBadDebt.text];
    period.inputData.incomeTax = [self transformNsstrinToNsnumber:self.txtIncomeTaxes.text];
    period.inputData.incomeTaxRegularization = [self transformNsstrinToNsnumber:self.txtIncomeTaxRegularization.text];
    period.inputData.loanIncomes = [self transformNsstrinToNsnumber:self.txtLoanIncomes.text];
    period.inputData.newLoanExpenses = [self transformNsstrinToNsnumber:self.txtNewLoanExpenses.text];
    period.inputData.oldLoanExpenses = [self transformNsstrinToNsnumber:self.txtOldLoanExpenses.text];
    period.inputData.payroll = [self transformNsstrinToNsnumber:self.txtPayroll.text];
    period.inputData.rawMaterials = [self transformNsstrinToNsnumber:self.txtRawMaterials.text];
    period.inputData.rawMaterialsCashPayment = [self transformNsstrinToNsnumber:self.txtRawMaterialsCashPayment.text];
    period.inputData.rawMaterialsPayment = [self transformNsstrinToNsnumber:self.txtRawMaterialsPayment.text];
    period.inputData.sales = [self transformNsstrinToNsnumber:self.txtSales.text];
    period.inputData.salesExpenses = [self transformNsstrinToNsnumber:self.txtSemestralReward.text];
    period.inputData.semestralRewards = [self transformNsstrinToNsnumber:self.txtSocialBenefit.text];
    period.inputData.socialBenefits = [self transformNsstrinToNsnumber:self.txtRawMaterialsPayment.text];
    period.inputData.tea = [self transformNsstrinToNsnumber:self.txtTea.text];
    period.inputData.variableManpower = [self transformNsstrinToNsnumber:self.txtVariableManpower.text];
    period.inputData.assetsPurchases = [self transformNsstrinToNsnumber:self.assetsPurchases.text];
    period.inputData.administrativeExpenses = [self transformNsstrinToNsnumber:self.administrativeExpenses.text];
    
    [[GenericService sharedService] commitChanges];
    
    
    [self onTapCancel:Nil];
    
}

- (IBAction)onTapDeleteData:(id)sender {
    
    if (isLastPeriod) {
        //delete the period
        [[CashFlowService sharedService] deletePeriod:period.inputData.period];
        [[GenericService sharedService] commitChanges];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateArrayFlows" object:nil];
    }else{
        period.inputData.badDebts = [NSNumber numberWithFloat:0.0f];
        period.inputData.baseRawMaterials = [NSNumber numberWithFloat:0.0f];
        period.inputData.cashDebtCollections = [NSNumber numberWithFloat:0.0f];
        period.inputData.creditSalesPenalty = [NSNumber numberWithFloat:0.0f];
        period.inputData.debtCollections = [NSNumber numberWithFloat:0.0f];
        period.inputData.dividends = [NSNumber numberWithFloat:0.0f];
        period.inputData.fixedAssetsExpense = [NSNumber numberWithFloat:0.0f];
        period.inputData.fixedManpower = [NSNumber numberWithFloat:0.0f];
        period.inputData.freights = [NSNumber numberWithFloat:0.0f];
        period.inputData.badDebts = [NSNumber numberWithFloat:0.0f];
        period.inputData.incomeTax = [NSNumber numberWithFloat:0.0f];
        period.inputData.incomeTaxRegularization = [NSNumber numberWithFloat:0.0f];
        period.inputData.loanIncomes = [NSNumber numberWithFloat:0.0f];
        period.inputData.newLoanExpenses = [NSNumber numberWithFloat:0.0f];
        period.inputData.oldLoanExpenses = [NSNumber numberWithFloat:0.0f];
        period.inputData.payroll = [NSNumber numberWithFloat:0.0f];
        period.inputData.rawMaterials = [NSNumber numberWithFloat:0.0f];
        period.inputData.rawMaterialsCashPayment = [NSNumber numberWithFloat:0.0f];
        period.inputData.rawMaterialsPayment = [NSNumber numberWithFloat:0.0f];
        period.inputData.sales = [NSNumber numberWithFloat:0.0f];
        period.inputData.salesExpenses = [NSNumber numberWithFloat:0.0f];
        period.inputData.semestralRewards = [NSNumber numberWithFloat:0.0f];
        period.inputData.socialBenefits = [NSNumber numberWithFloat:0.0f];
        period.inputData.tea = [NSNumber numberWithFloat:0.0f];
        period.inputData.variableManpower = [NSNumber numberWithFloat:0.0f];
        period.inputData.assetsPurchases = [NSNumber numberWithFloat:0.0f];
        period.inputData.administrativeExpenses = [NSNumber numberWithFloat:0.0f];
        
        [[GenericService sharedService] commitChanges];
    }
    
    [self onTapCancel:nil];
}
@end
