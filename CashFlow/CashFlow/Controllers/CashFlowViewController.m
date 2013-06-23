//
//  CashFlowViewController.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/8/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "CashFlowViewController.h"


@interface CashFlowViewController ()

@property (strong, nonatomic) ShinobiDataGrid *grid;

- (void)setupGrid;

@end

@implementation CashFlowViewController


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGrid];
}

#pragma mark -
#pragma mark Private Methods

- (void)setupGrid
{
    //self.grid = [[ShinobiDataGrid alloc] initWithFrame:CGRectInset(self.view.bounds, 30, 30)];
	self.grid.licenseKey = kLicenseKey;
    
    /*
    // add the columns
    SDataGridColumn* entryColumn = [[SDataGridColumn alloc] initWithTitle:@"Ingresos"];
    symbolColumn.width = @80;
    [_shinobiDataGrid addColumn:symbolColumn];
    
    SDataGridColumn* nameColumn = [[SDataGridColumn alloc] initWithTitle:@"name"];
    nameColumn.width = @385;
    [_shinobiDataGrid addColumn:nameColumn];
    
    SDataGridColumn* bidColumn = [[SDataGridColumn alloc] initWithTitle:@"bid"];
    bidColumn.width = @120;
    [_shinobiDataGrid addColumn:bidColumn];
    
    SDataGridColumn* askColumn = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn];
    
    SDataGridColumn* askColumn2 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn2];
    
    SDataGridColumn* askColumn3 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn3];
    
    SDataGridColumn* askColumn4 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn4];
    
    SDataGridColumn* askColumn5 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn5];
    
    SDataGridColumn* askColumn6 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn6];
    
    SDataGridColumn* askColumn7 = [[SDataGridColumn alloc] initWithTitle:@"ask"];
    askColumn.width = @120;
    [_shinobiDataGrid addColumn:askColumn7];
    
    // remove the gridlines
    _shinobiDataGrid.defaultGridLineStyle = [SDataGridLineStyle styleWithWidth:0.0f withColor:[UIColor clearColor]];
    
    // create an alternating row style that just sets the background color
    SDataGridCellStyle* alternatingStyle = [[SDataGridCellStyle alloc] init];
    alternatingStyle.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    _shinobiDataGrid.defaultCellStyleForAlternateRows = alternatingStyle;
    
    // make the symbol column bold
    SDataGridCellStyle* boldStyle = [[SDataGridCellStyle alloc] init];
    boldStyle.font = [UIFont boldSystemFontOfSize:_shinobiDataGrid.defaultCellStyleForRows.font.pointSize];
    symbolColumn.cellStyle = boldStyle;
    
    // tint the bid and ask columns
    SDataGridCellStyle* columnStyle = [[SDataGridCellStyle alloc] init];
    columnStyle.backgroundColor = [UIColor colorWithRed:0.0f green:1.0f blue:0.0f alpha:0.1f];
    bidColumn.cellStyle = columnStyle;
    askColumn.cellStyle = columnStyle;
    
    // add a gradient to the selected row
    NSArray* colors = @[[UIColor colorWithWhite:1.0 alpha:0.5],[UIColor colorWithWhite:1.0 alpha:0.1]];
    NSArray* stops = @[@0.0, @1.0];
    _shinobiDataGrid.defaultCellStyleForSelectedRows.gradient =
    [SDataGridGradient gradientWithColors:colors locations:stops];
    
    // style the headers to have a dark background, and white text
    _shinobiDataGrid.defaultCellStyleForHeaderRow.backgroundColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
    _shinobiDataGrid.defaultCellStyleForHeaderRow.textColor = [UIColor whiteColor];
    
    // create some data to populate the grid
    _data = [StockPriceDataSource getStockPrices];
    
    // set the data-source, this is the class responsible for supplying data to the grid.
    _shinobiDataGrid.dataSource = self;
     */
    
    [self.view addSubview:self.grid];
}

@end
