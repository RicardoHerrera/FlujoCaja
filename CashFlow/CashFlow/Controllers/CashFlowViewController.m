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

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cashFlow = [[CashFlowService sharedService] getCashFlowWithPredicate:[NSPredicate predicateWithFormat:@"name == %@",@"Hello Cash Flow"]];
    
    self.processedCashFlow = [[ProcessedCashFlow alloc] initWithCashFlow:self.cashFlow];
    self.cashFlowDataSource = [[CashFlowGridDataSource alloc] initWithProcessedCashFlow:self.processedCashFlow];
    self.plannedCashFlowDataSource = [[PlannedCashFlowGridDataSource alloc] initWithProcessedCashFlow:self.processedCashFlow];
    
    [self setupGrid];
}

#pragma mark -
#pragma mark Custom Accessors

- (void)setViewMode:(CashFlowViewMode)viewMode
{
    if (self.viewMode != viewMode) {
        _viewMode = viewMode;
        self.grid.dataSource = (self.viewMode == CashFlowViewModeDefault)? self.cashFlowDataSource : self.plannedCashFlowDataSource;
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
        periodColumn.width = @200;
        periodColumn.tag = periodCashFlow.periodNumber;
        
        [self.grid addColumn:periodColumn];
        
        if (i == self.processedCashFlow.periodCashFlows.count - 1) {
            SDataGridCellStyle* highlightedStyle = [[SDataGridCellStyle alloc] init];
            highlightedStyle.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f];
            periodColumn.cellStyle = highlightedStyle;
        }
    }
    
    self.grid.dataSource = self.cashFlowDataSource;
}



@end
