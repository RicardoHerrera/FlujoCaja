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

@interface FirstInputDataView ()

@end

@implementation FirstInputDataView

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapCancel:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)onTapDone:(id)sender {
    /*
    FirstPeriodInputData *Fpd = [[FirstPeriodInputData alloc] init];
    
    Fpd.endBalance = [NSNumber numberWithFloat:[_txtFinalBalance.text floatValue]];
    Fpd.igv = [NSNumber numberWithFloat:[_txtIgv.text floatValue]];
    Fpd.oldLoans = [NSNumber numberWithFloat:[_txtOldLoan.text floatValue]];
    Fpd.rawMaterials = [NSNumber numberWithFloat:[_txtRawMaterial.text floatValue]];
    Fpd.sales = [NSNumber numberWithFloat:[_txtSales.text floatValue]];
    */
    
}

- (IBAction)onTapHelpMessage:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Messages" ofType:@"plist"];
    
    NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    
    NSArray *messages = [root objectForKey:@"FirstPeriodInputDataMessages"];
    
    NSLog(@"messages : %@", [messages objectAtIndex:[sender tag]]);
    
    [[[AlertViewsFactory sharedFactory] createAlertViewWithTitle:@"Cash Flow" andMessage:[messages objectAtIndex:[sender tag]]] show];
}
@end
