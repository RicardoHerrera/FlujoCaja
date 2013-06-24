//
//  FirstInputDataView.m
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 23/06/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "FirstInputDataView.h"
#import "FirstPeriodInputData.h"
#import "AlertViewsFactory.h"
#import "GenericService.h"

@interface FirstInputDataView ()

@end

@implementation FirstInputDataView

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
#pragma mark interfaceMethods
- (void)fullFields{
    
    self.txtFinalBalance.text = [self transformNsNumberToNsstring:period.endBalance];
    self.txtIgv.text = [self transformNsNumberToNsstring:period.igv];
    self.txtOldLoan.text = [self transformNsNumberToNsstring:period.oldLoans];
    self.txtRawMaterial.text = [self transformNsNumberToNsstring:period.rawMaterials];
    self.txtSales.text = [self transformNsNumberToNsstring:period.sales];
}

#pragma mark helper methods
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

#pragma mark on tap methods
- (IBAction)onTapCancel:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)onTapDone:(id)sender {
    
    //Verify fields
    //Save data
    period.endBalance = [self transformNsstrinToNsnumber:self.txtFinalBalance.text];
    period.igv = [self transformNsstrinToNsnumber:self.txtIgv.text];
    period.oldLoans = [self transformNsstrinToNsnumber:self.txtOldLoan.text];
    period.rawMaterials = [self transformNsstrinToNsnumber:self.txtRawMaterial.text];
    period.sales = [self transformNsstrinToNsnumber:self.txtSales.text];
    
    [[GenericService sharedService] commitChanges];
    
    [self onTapCancel:Nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadGrid" object:nil];
}

- (IBAction)onTapHelpMessage:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Messages" ofType:@"plist"];
    
    NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *messages = [root objectForKey:@"FirstPeriodInputDataMessages"];
    
    [[[AlertViewsFactory sharedFactory] createAlertViewWithTitle:@"Cash Flow" andMessage:[messages objectAtIndex:[sender tag]]] show];
}
@end
