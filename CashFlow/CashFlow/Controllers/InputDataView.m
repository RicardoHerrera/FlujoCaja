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
#import "Period.h"

@interface InputDataView ()

@end

@implementation InputDataView

@synthesize period;
@synthesize isLastPeriod;
@synthesize cashFlow;

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
    if (period || self.lastPeriod) {
        [self fullFields];
    }
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleDone target:self action:@selector(onTapDone:)];
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStyleBordered target:self action:@selector(onTapDeleteData:)];
    
    self.navItem.rightBarButtonItems = @[doneItem, deleteItem];
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
    
    PeriodCashFlow *p = (self.period)? self.period : self.lastPeriod;
    if (p.periodNumber == 0) {
        return;
    }
    
    self.txtBadDebt.text = [self transformNsNumberToNsstring:p.inputData.badDebts];
    self.txtBaseRawMaterial.text = [self transformNsNumberToNsstring:p.inputData.baseRawMaterials];
    self.txtCashDebtCollections.text = [self transformNsNumberToNsstring:p.inputData.cashDebtCollections];
    self.txtCreditSalesPenalty.text = [self transformNsNumberToNsstring:p.inputData.creditSalesPenalty];
    self.txtDebtCollections.text = [self transformNsNumberToNsstring:p.inputData.debtCollections];
    self.txtDividends.text = [self transformNsNumberToNsstring:p.inputData.dividends];
    self.txtFixedAssetsExpense.text = [self transformNsNumberToNsstring:p.inputData.fixedAssetsExpense];
    self.txtFixedManPower.text = [self transformNsNumberToNsstring:p.inputData.fixedManpower];
    self.txtFreights.text = [self transformNsNumberToNsstring:p.inputData.freights];
    self.txtIgv.text = [self transformNsNumberToNsstring:p.inputData.igv];
    self.txtIncomeTaxes.text = [self transformNsNumberToNsstring:p.inputData.incomeTax];
    self.txtIncomeTaxRegularization.text = [self transformNsNumberToNsstring:p.inputData.incomeTaxRegularization];
    self.txtLoanIncomes.text = [self transformNsNumberToNsstring:p.inputData.loanIncomes];
    self.txtNewLoanExpenses.text = [self transformNsNumberToNsstring:p.inputData.newLoanExpenses];
    self.txtOldLoanExpenses.text = [self transformNsNumberToNsstring:p.inputData.oldLoanExpenses];
    self.txtPayroll.text = [self transformNsNumberToNsstring:p.inputData.payroll];
    self.txtRawMaterials.text = [self transformNsNumberToNsstring:p.inputData.rawMaterials];
    self.txtRawMaterialsCashPayment.text = [self transformNsNumberToNsstring:p.inputData.rawMaterialsCashPayment];
    self.txtRawMaterialsPayment.text = [self transformNsNumberToNsstring:p.inputData.rawMaterialsPayment];
    self.txtSales.text = [self transformNsNumberToNsstring:p.inputData.sales];
    self.txtSalesExpenses.text = [self transformNsNumberToNsstring:p.inputData.salesExpenses];
    self.txtSemestralReward.text = [self transformNsNumberToNsstring:p.inputData.semestralRewards];
    self.txtSocialBenefit.text = [self transformNsNumberToNsstring:p.inputData.socialBenefits];
    self.txtTea.text = [self transformNsNumberToNsstring:p.inputData.tea];
    self.txtVariableManpower.text = [self transformNsNumberToNsstring:p.inputData.variableManpower];
    self.assetsPurchases.text = [self transformNsNumberToNsstring:p.inputData.assetsPurchases];
    self.administrativeExpenses.text = [self transformNsNumberToNsstring:p.inputData.administrativeExpenses];
    
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

- (void)createNewPeriod{
    
    
    Period *aPeriod = [[CashFlowService sharedService] createPeriod];
    
    aPeriod.number = [NSNumber numberWithInteger:self.lastPeriod.periodNumber + 1 ];
    
    PeriodInputData *anInput = [[CashFlowService sharedService] createPeriodInputData];
    
    anInput.badDebts = [self transformNsstrinToNsnumber:self.txtBadDebt.text];
    anInput.baseRawMaterials = [self transformNsstrinToNsnumber:self.txtBaseRawMaterial.text];
    anInput.cashDebtCollections = [self transformNsstrinToNsnumber:self.txtCashDebtCollections.text];
    anInput.creditSalesPenalty = [self transformNsstrinToNsnumber:self.txtCreditSalesPenalty.text];
    anInput.debtCollections = [self transformNsstrinToNsnumber:self.txtDebtCollections.text];
    anInput.dividends = [self transformNsstrinToNsnumber:self.txtDividends.text];
    anInput.fixedAssetsExpense = [self transformNsstrinToNsnumber:self.txtFixedAssetsExpense.text];
    anInput.fixedManpower = [self transformNsstrinToNsnumber:self.txtFixedManPower.text];
    anInput.freights = [self transformNsstrinToNsnumber:self.txtFreights.text];
    anInput.badDebts = [self transformNsstrinToNsnumber:self.txtBadDebt.text];
    anInput.incomeTax = [self transformNsstrinToNsnumber:self.txtIncomeTaxes.text];
    anInput.incomeTaxRegularization = [self transformNsstrinToNsnumber:self.txtIncomeTaxRegularization.text];
    anInput.loanIncomes = [self transformNsstrinToNsnumber:self.txtLoanIncomes.text];
    anInput.newLoanExpenses = [self transformNsstrinToNsnumber:self.txtNewLoanExpenses.text];
    anInput.oldLoanExpenses = [self transformNsstrinToNsnumber:self.txtOldLoanExpenses.text];
    anInput.payroll = [self transformNsstrinToNsnumber:self.txtPayroll.text];
    anInput.rawMaterials = [self transformNsstrinToNsnumber:self.txtRawMaterials.text];
    anInput.rawMaterialsCashPayment = [self transformNsstrinToNsnumber:self.txtRawMaterialsCashPayment.text];
    anInput.rawMaterialsPayment = [self transformNsstrinToNsnumber:self.txtRawMaterialsPayment.text];
    anInput.sales = [self transformNsstrinToNsnumber:self.txtSales.text];
    anInput.salesExpenses = [self transformNsstrinToNsnumber:self.txtSalesExpenses.text];
    anInput.semestralRewards = [self transformNsstrinToNsnumber:self.txtSemestralReward.text];
    anInput.socialBenefits = [self transformNsstrinToNsnumber:self.txtSocialBenefit.text];
    anInput.tea = [self transformNsstrinToNsnumber:self.txtTea.text];
    anInput.variableManpower = [self transformNsstrinToNsnumber:self.txtVariableManpower.text];
    anInput.assetsPurchases = [self transformNsstrinToNsnumber:self.assetsPurchases.text];
    anInput.administrativeExpenses = [self transformNsstrinToNsnumber:self.administrativeExpenses.text];
    anInput.igv = [self transformNsstrinToNsnumber:self.txtIgv.text];
    
    anInput.period = aPeriod;
    
    aPeriod.cashFlow = self.cashFlow;
    
    [[GenericService sharedService] commitChanges];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateWithNewFlow" object:nil];
}

#pragma mark buttons actions
- (IBAction)onTapCancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:Nil];
}

- (IBAction)onTapDone:(id)sender {
    
    //Verify fields
    
    //Save Data
    if (period != nil) {
        period.inputData.badDebts = [self transformNsstrinToNsnumber:self.txtBadDebt.text];
        period.inputData.baseRawMaterials = [self transformNsstrinToNsnumber:self.txtBaseRawMaterial.text];
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
        period.inputData.salesExpenses = [self transformNsstrinToNsnumber:self.txtSalesExpenses.text];
        period.inputData.semestralRewards = [self transformNsstrinToNsnumber:self.txtSemestralReward.text];
        period.inputData.socialBenefits = [self transformNsstrinToNsnumber:self.txtSocialBenefit.text];
        period.inputData.tea = [self transformNsstrinToNsnumber:self.txtTea.text];
        period.inputData.variableManpower = [self transformNsstrinToNsnumber:self.txtVariableManpower.text];
        period.inputData.assetsPurchases = [self transformNsstrinToNsnumber:self.assetsPurchases.text];
        period.inputData.administrativeExpenses = [self transformNsstrinToNsnumber:self.administrativeExpenses.text];
        period.inputData.igv = [self transformNsstrinToNsnumber:self.txtIgv.text];
        
        [[GenericService sharedService] commitChanges];
        
    }else{
        [self createNewPeriod];
    }
    
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
