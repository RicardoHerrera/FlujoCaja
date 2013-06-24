//
//  CashFlowViewController.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/8/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "CashFlowViewController.h"
#import "ProcessedCashFlow.h"
#import "PeriodCashFlow.h"
#import "CashFlowService.h"
#import "CashFlowGridDataSource.h"
#import "PlannedCashFlowGridDataSource.h"

#import "CashFlowService.h"
#import "CashFlow.h"
#import "InputDataView.h"
#import "FirstInputDataView.h"

typedef enum {
    CashFlowViewModeDefault,
    CashFlowViewModePlanned
}CashFlowViewMode;

@interface CashFlowViewController ()

@property (strong, nonatomic) ProcessedCashFlow *processedCashFlow;
@property (strong, nonatomic) CashFlowGridDataSource *cashFlowDataSource;
@property (strong, nonatomic) PlannedCashFlowGridDataSource *plannedCashFlowDataSource;

@property (nonatomic) CashFlowViewMode viewMode;

@end

@implementation CashFlowViewController

@synthesize selectedIndex = _selectedIndex;

#pragma mark notification methods
- (void)updateArray:(NSNotification *)notification{
    [self.grid removeColumnAtIndex:self.processedCashFlow.periodCashFlows.count];
    [self.processedCashFlow.periodCashFlows removeLastObject];
    [self.processedCashFlow.periodPlannedCashFlows removeLastObject];
    
    for (PeriodCashFlow *aFlow in self.processedCashFlow.periodCashFlows) {
        if (aFlow.dateString != nil) {
            [arrayFlujos addObject:aFlow.dateString];
        }else{
            [arrayFlujos addObject:@""];
        }
    }
    
    [self.grid reload];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cashFlow = [[CashFlowService sharedService] getCashFlowWithPredicate:[NSPredicate predicateWithFormat:@"name == %@",@"Hello Cash Flow"]];
    
    arrayFlujos = [[NSMutableArray alloc] init];
    
    self.processedCashFlow = [[ProcessedCashFlow alloc] initWithCashFlow:self.cashFlow];
    self.cashFlowDataSource = [[CashFlowGridDataSource alloc] initWithProcessedCashFlow:self.processedCashFlow];
    self.plannedCashFlowDataSource = [[PlannedCashFlowGridDataSource alloc] initWithProcessedCashFlow:self.processedCashFlow];
    
    for (PeriodCashFlow *aFlow in self.processedCashFlow.periodCashFlows) {
        if (aFlow.dateString != nil) {
            [arrayFlujos addObject:aFlow.dateString];
        }else{
            [arrayFlujos addObject:@""];
        }
    }
    
    [self setupGrid];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.grid selector:@selector(reload) name:@"ReloadGrid" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateArray:) name:@"updateArrayFlows" object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:TRUE];
    
    [self.grid reload];
}

#pragma mark -
#pragma mark Custom Accessors

- (void)setViewMode:(CashFlowViewMode)viewMode
{
    if (self.viewMode != viewMode) {
        _viewMode = viewMode;
        self.grid.dataSource = (self.viewMode == CashFlowViewModeDefault)? self.cashFlowDataSource : self.plannedCashFlowDataSource;
        self.viewModeButton.title = (self.viewMode != CashFlowViewModeDefault)? @"Flujo detallado" : @"Flujo planeado";
        [self.grid reload];
    }
}

#pragma mark -
#pragma mark Private Methods

- (IBAction)toggleCashFlowViewMode:(UIBarButtonItem *)sender
{
    self.viewMode = (self.viewMode == CashFlowViewModeDefault)? CashFlowViewModePlanned : CashFlowViewModeDefault;
}

- (void)setupGrid
{
    self.grid = [[ShinobiDataGrid alloc] initWithFrame:[self gridFrameForOrientation:self.interfaceOrientation]];
    [self.view addSubview:self.grid];
    
	self.grid.licenseKey = kLicenseKey;
    
    self.grid.defaultCellStyleForHeaderRow.backgroundColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    self.grid.defaultCellStyleForHeaderRow.textColor = [UIColor whiteColor];
    
    SDataGridCellStyle* alternatingStyle = [[SDataGridCellStyle alloc] init];
    alternatingStyle.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    self.grid.defaultCellStyleForAlternateRows = alternatingStyle;
    
    NSArray* colors = @[[UIColor colorWithWhite:1.0 alpha:0.5],[UIColor colorWithWhite:1.0 alpha:0.1]];
    NSArray* stops = @[@0.0, @1.0];
    self.grid.defaultCellStyleForSelectedRows.gradient =
    [SDataGridGradient gradientWithColors:colors locations:stops];
    
    SDataGridColumn* entryColumn = [[SDataGridColumn alloc] initWithTitle:@""];
    entryColumn.width = @300;
    entryColumn.tag = -1;
    [self.grid addColumn:entryColumn];
    
    SDataGridCellStyle* boldStyle = [[SDataGridCellStyle alloc] init];
    boldStyle.font = [UIFont boldSystemFontOfSize:self.grid.defaultCellStyleForRows.font.pointSize];
    entryColumn.cellStyle = boldStyle;
    
    for (int i = 0; i < self.processedCashFlow.periodCashFlows.count; i++) {
        PeriodCashFlow *periodCashFlow = self.processedCashFlow.periodCashFlows[i];
        SDataGridColumn* periodColumn = [[SDataGridColumn alloc] initWithTitle:periodCashFlow.dateString];
        
        //[[SDataGridColumn alloc] initWithTitle:periodCashFlow.dateString forProperty:@"header" cellType:nil headerCellType:[MyHeaderCell class]];
        periodColumn.width = @200;
        periodColumn.tag = periodCashFlow.periodNumber;
        
        [self.grid addColumn:periodColumn];
        
        if (i == 0) {
            SDataGridCellStyle* highlightedStyle = [[SDataGridCellStyle alloc] init];
            highlightedStyle.backgroundColor = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:0.1f];
            periodColumn.cellStyle = highlightedStyle;
        }
    }
    
    self.grid.dataSource = self.cashFlowDataSource;
}


- (IBAction)onTapModify:(id)sender {
    [ActionSheetStringPicker showPickerWithTitle:@"Seleccione Periodo" rows:arrayFlujos initialSelection:self.selectedIndex target:self successAction:@selector(flowWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:sender];
}

- (void)flowWasSelected:(NSNumber *)selectedIndex element:(id)element {
    
    self.selectedIndex = [selectedIndex intValue];
    
    if (self.selectedIndex == 0) {
        [self performSegueWithIdentifier:@"ToFirstPeriodInputData" sender:self];
    }else{
        [self performSegueWithIdentifier:@"ToPeriodInputData" sender:self];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ToPeriodInputData"])
    {
        // Get reference to the destination view controller
        InputDataView *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setPeriod:self.processedCashFlow.periodCashFlows[self.selectedIndex]];
        
        if (self.selectedIndex == [self.processedCashFlow.periodCashFlows count] -1) {
            [vc setIsLastPeriod:TRUE];
        }
        
    }
    if ([[segue identifier] isEqualToString:@"ToFirstPeriodInputData"])
    {
        // Get reference to the destination view controller
        FirstInputDataView *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setPeriod: self.cashFlow.firstPeriodInputData];
    }

}

- (void)actionPickerCancelled:(id)sender {
    NSLog(@"Delegate has been informed that ActionSheetPicker was cancelled");

}
@end
