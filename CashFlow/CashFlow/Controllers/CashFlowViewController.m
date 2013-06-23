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
#import "PeriodIncomes.h"
#import "SalesIncomes.h"
#import "PeriodExpenses.h"
#import "IncomeTaxesExpenses.h"
#import "LoanExpenses.h"
#import "ManpowerExpenses.h"
#import "RawMaterialExpenses.h"
#import "SalaryExpenses.h"
#import "CashFlowService.h"

#define ROW_INCOMES_SALES 0
#define ROW_INCOMES_SALES_CASH 1
#define ROW_INCOMES_SALES_CREDIT 2
#define ROW_INCOMES_SALES_PENALTY 3
#define ROW_INCOMES_SALES_BAD_DEBTS 4
#define ROW_INCOMES_DEBT_COLLECTIONS 5
#define ROW_INCOMES_LOANS 6
#define ROW_INCOMES_SALES_IGV 7

#define ROW_EXPENSES_RAW_MATERIAL 0
#define ROW_EXPENSES_RAW_MATERIAL_CASH 1
#define ROW_EXPENSES_RAW_MATERIAL_CREDIT 2
#define ROW_EXPENSES_RAW_MATERIAL_TOTAL 3
#define ROW_EXPENSES_ASSETS_PURCHASES 4
#define ROW_EXPENSES_TAX_CREDIT 5

#define ROW_EXPENSES_MANPOWER 7
#define ROW_EXPENSES_MANPOWER_FIXED 8
#define ROW_EXPENSES_MANPOWER_VARIABLE 9
#define ROW_EXPENSES_MANPOWER_TOTAL 10

#define ROW_EXPENSES_SALARY 12
#define ROW_EXPENSES_SALARY_PAYROLL 13
#define ROW_EXPENSES_SALARY_SOCIAL_BENEFITS 14
#define ROW_EXPENSES_SALARY_TOTAL 15

#define ROW_EXPENSES_ADMINISTRATIVE_EXPENSES 17

#define ROW_EXPENSES_SALES_COMMISIONS 19

#define ROW_EXPENSES_INCOME_TAXES 21
#define ROW_EXPENSES_INCOME_TAXES_ADVANCE_PAYMENT 22
#define ROW_EXPENSES_INCOME_TAXES_REGULARIZATION 23
#define ROW_EXPENSES_INCOME_TAXES_TOTAL 24

#define ROW_EXPENSES_DIVIDENDS 26

#define ROW_EXPENSES_LOANS_NEW 28
#define ROW_EXPENSES_LOANS_OLD 29

@interface CashFlowViewController ()

@property (strong, nonatomic) ShinobiDataGrid *grid;
@property (strong, nonatomic) ProcessedCashFlow *processedCashFlow;

- (void)setupGrid;
- (void)fixupGridWithOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (CGRect)gridFrameForOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (void)prepareEntryCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates;
- (void)prepareFirstPeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates;
- (void)preparePeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates andPeriodNumber:(NSInteger)periodNumber;

@end

@implementation CashFlowViewController


#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cashFlow = [[CashFlowService sharedService] getCashFlowWithPredicate:[NSPredicate predicateWithFormat:@"name == %@",@"Hello Cash Flow"]];
    
    self.processedCashFlow = [[ProcessedCashFlow alloc] initWithCashFlow:self.cashFlow];
    
    [self setupGrid];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self fixupGridWithOrientation:toInterfaceOrientation];
}

#pragma mark -
#pragma mark Shinobi Data Grid Protocols

- (NSUInteger) numberOfSectionsInShinobiDataGrid:(ShinobiDataGrid *) grid
{
    return 2;
}

- (NSString *)shinobiDataGrid:(ShinobiDataGrid *)grid titleForHeaderInSection:(int)section
{
    NSString *title = @"";
    
    switch (section) {
        case 0:
            title = @"Ingresos";
            break;
        case 1:
            title = @"Egresos";
            break;
        default:
            break;
    }
    
    return title;
}

-(NSUInteger)shinobiDataGrid:(ShinobiDataGrid *)grid numberOfRowsInSection:(int)sectionIndex
{
    NSInteger numberOfRows = 0;
    
    switch (sectionIndex) {
        case 0:
            numberOfRows = 8;
            break;
        case 1:
            numberOfRows = 30;
            break;
        default:
            break;
    }
    
    return numberOfRows;
}

- (void)shinobiDataGrid:(ShinobiDataGrid *)grid prepareCellForDisplay:(SDataGridCell *)cell
{
    SDataGridCoord *coordinates = cell.coordinate;
    NSInteger tag = coordinates.column.tag;
    if (tag == -1) {
        [self prepareEntryCellForDisplay:cell withCoordinates:coordinates];
    }
    else if (tag == 0) {
        [self prepareFirstPeriodCellForDisplay:cell withCoordinates:coordinates];
    }
    else {
        [self preparePeriodCellForDisplay:cell withCoordinates:coordinates andPeriodNumber:coordinates.column.tag];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)setupGrid
{
    self.grid = [[ShinobiDataGrid alloc] initWithFrame:[self gridFrameForOrientation:self.interfaceOrientation]];
    [self.view addSubview:self.grid];
    
	self.grid.licenseKey = kLicenseKey;
    self.grid.dataSource = self;
    
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
        periodColumn.width = @150;
        periodColumn.tag = periodCashFlow.periodNumber;
        
        [self.grid addColumn:periodColumn];
        
        if (i == self.processedCashFlow.periodCashFlows.count - 1) {
            SDataGridCellStyle* highlightedStyle = [[SDataGridCellStyle alloc] init];
            highlightedStyle.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.1f];
            periodColumn.cellStyle = highlightedStyle;
        }
    }
    
    self.grid.dataSource = self;
}

- (void)fixupGridWithOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (self.grid) {
        self.grid.frame = [self gridFrameForOrientation:toInterfaceOrientation];
    }
}

- (CGRect)gridFrameForOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
    }
    else {
        return CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_WIDTH - 44);
    }
}

- (void)prepareEntryCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates
{
    NSInteger section = coordinates.row.sectionIndex;
    NSInteger row = coordinates.row.rowIndex;
    
    SDataGridTextCell *textCell = (SDataGridTextCell*)cell;
    
    switch (section) {
        case 0:
            switch (row) {
                case ROW_INCOMES_SALES:
                    textCell.textField.text = @"Ventas";
                    break;
                case ROW_INCOMES_SALES_CASH:
                    textCell.textField.text = @"Ventas al contado";
                    break;
                case ROW_INCOMES_SALES_CREDIT:
                    textCell.textField.text = @"Ventas al crédito a 30 días";
                    break;
                case ROW_INCOMES_SALES_PENALTY:
                    textCell.textField.text = @"Penalidad por ventas al crédito";
                    break;
                case ROW_INCOMES_SALES_BAD_DEBTS:
                    textCell.textField.text = @"Incobrable";
                    break;
                case ROW_INCOMES_DEBT_COLLECTIONS:
                    textCell.textField.text = @"Cobranzas";
                    break;
                case ROW_INCOMES_LOANS:
                    textCell.textField.text = @"Préstamo";
                    break;
                case ROW_INCOMES_SALES_IGV:
                    textCell.textField.text = @"I.G.V. por ventas";
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 1:
            switch (row) {
                case ROW_EXPENSES_RAW_MATERIAL:
                    textCell.textField.text = @"Materia prima";
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_CASH:
                    textCell.textField.text = @"Compras al contado";
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_CREDIT:
                    textCell.textField.text = @"Compras al crédito";
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_TOTAL:
                    textCell.textField.text = @"Total materia prima";
                    break;
                case ROW_EXPENSES_ASSETS_PURCHASES:
                    textCell.textField.text = @"Compra de activos";
                    break;
                case ROW_EXPENSES_TAX_CREDIT:
                    textCell.textField.text = @"Crédito Fiscal";
                    break;
                case ROW_EXPENSES_MANPOWER:
                    textCell.textField.text = @"Mano de obra";
                    break;
                case ROW_EXPENSES_MANPOWER_FIXED:
                    textCell.textField.text = @"Fija";
                    break;
                case ROW_EXPENSES_MANPOWER_VARIABLE:
                    textCell.textField.text = @"Variable";
                    break;
                case ROW_EXPENSES_MANPOWER_TOTAL:
                    textCell.textField.text = @"Total mano de obra";
                    break;
                case ROW_EXPENSES_SALARY:
                    textCell.textField.text = @"Sueldos";
                    break;
                case ROW_EXPENSES_SALARY_PAYROLL:
                    textCell.textField.text = @"Planilla mensual";
                    break;
                case ROW_EXPENSES_SALARY_SOCIAL_BENEFITS:
                    textCell.textField.text = @"Beneficios sociales";
                    break;
                case ROW_EXPENSES_SALARY_TOTAL:
                    textCell.textField.text = @"Total sueldos";
                    break;
                case ROW_EXPENSES_ADMINISTRATIVE_EXPENSES:
                    textCell.textField.text = @"Gastos administrativos";
                    break;
                case ROW_EXPENSES_SALES_COMMISIONS:
                    textCell.textField.text = @"Comisiones de ventas";
                    break;
                case ROW_EXPENSES_INCOME_TAXES:
                    textCell.textField.text = @"Impuesto a la renta";
                    break;
                case ROW_EXPENSES_INCOME_TAXES_ADVANCE_PAYMENT:
                    textCell.textField.text = @"Pago a cuenta";
                    break;
                case ROW_EXPENSES_INCOME_TAXES_REGULARIZATION:
                    textCell.textField.text = @"Regularización";
                    break;
                case ROW_EXPENSES_INCOME_TAXES_TOTAL:
                    textCell.textField.text = @"Total impuesto a la renta";
                    break;
                case ROW_EXPENSES_DIVIDENDS:
                    textCell.textField.text = @"Dividendos";
                    break;
                case ROW_EXPENSES_LOANS_NEW:
                    textCell.textField.text = @"Préstamo nuevo";
                    break;
                case ROW_EXPENSES_LOANS_OLD:
                    textCell.textField.text = @"Préstamo antiguo";
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        default:
            break;
    }
}

- (void)prepareFirstPeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates
{
    NSInteger section = coordinates.row.sectionIndex;
    NSInteger row = coordinates.row.rowIndex;
    
    SDataGridTextCell *textCell = (SDataGridTextCell*)cell;
    
    PeriodCashFlow *firstPeriodCashFlow = self.processedCashFlow.periodCashFlows[0];
    
    switch (section) {
        case 0:
            switch (row) {
                case ROW_INCOMES_SALES:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", firstPeriodCashFlow.incomes.salesIncomes.sales];
                    break;
                case ROW_INCOMES_SALES_IGV:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", firstPeriodCashFlow.incomes.salesIGV];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 1:
            switch (row) {
                case ROW_EXPENSES_RAW_MATERIAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", firstPeriodCashFlow.expenses.rawMaterialExpenses.rawMaterials];
                    break;
                case ROW_EXPENSES_TAX_CREDIT:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", firstPeriodCashFlow.expenses.taxCredit];
                    break;
                case ROW_EXPENSES_LOANS_OLD:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", firstPeriodCashFlow.expenses.loanExpenses.oldLoans];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        default:
            break;
    }
}

- (void)preparePeriodCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates andPeriodNumber:(NSInteger)periodNumber
{
    NSInteger section = coordinates.row.sectionIndex;
    NSInteger row = coordinates.row.rowIndex;
    
    SDataGridTextCell *textCell = (SDataGridTextCell*)cell;
    
    PeriodCashFlow *periodCashFlow = self.processedCashFlow.periodCashFlows[periodNumber];
    
    switch (section) {
        case 0:
            switch (row) {
                case ROW_INCOMES_SALES:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIncomes.sales];
                    break;
                case ROW_INCOMES_SALES_CASH:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIncomes.cash];
                    break;
                case ROW_INCOMES_SALES_CREDIT:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIncomes.credit];
                    break;
                case ROW_INCOMES_SALES_PENALTY:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIncomes.penalty];
                    break;
                case ROW_INCOMES_SALES_BAD_DEBTS:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIncomes.badDebts];
                    break;
                case ROW_INCOMES_DEBT_COLLECTIONS:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.debtCollections];
                    break;
                case ROW_INCOMES_LOANS:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.loans];
                    break;
                case ROW_INCOMES_SALES_IGV:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", periodCashFlow.incomes.salesIGV];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 1:
            switch (row) {
                case ROW_EXPENSES_RAW_MATERIAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.rawMaterialExpenses.rawMaterials];
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_CASH:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.rawMaterialExpenses.cash];
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_CREDIT:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.rawMaterialExpenses.credit];
                    break;
                case ROW_EXPENSES_RAW_MATERIAL_TOTAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.rawMaterialExpenses.total];
                    break;
                case ROW_EXPENSES_ASSETS_PURCHASES:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.assetsPurchases];
                    break;
                case ROW_EXPENSES_TAX_CREDIT:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.taxCredit];
                    break;
                case ROW_EXPENSES_MANPOWER_FIXED:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.manpowerExpenses.fixed];
                    break;
                case ROW_EXPENSES_MANPOWER_VARIABLE:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.manpowerExpenses.variable];
                    break;
                case ROW_EXPENSES_MANPOWER_TOTAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.manpowerExpenses.total];
                    break;
                case ROW_EXPENSES_SALARY_PAYROLL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.salaryExpenses.payroll];
                    break;
                case ROW_EXPENSES_SALARY_SOCIAL_BENEFITS:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.salaryExpenses.socialBenefits];
                    break;
                case ROW_EXPENSES_SALARY_TOTAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.salaryExpenses.total];
                    break;
                case ROW_EXPENSES_ADMINISTRATIVE_EXPENSES:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.administrativeExpenses];
                    break;
                case ROW_EXPENSES_SALES_COMMISIONS:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.salesCommissions];
                    break;
                case ROW_EXPENSES_INCOME_TAXES_ADVANCE_PAYMENT:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.incomeTaxesExpenses.advancePayment];
                    break;
                case ROW_EXPENSES_INCOME_TAXES_REGULARIZATION:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.incomeTaxesExpenses.regularization];
                    break;
                case ROW_EXPENSES_INCOME_TAXES_TOTAL:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.incomeTaxesExpenses.total];
                    break;
                case ROW_EXPENSES_DIVIDENDS:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.dividends];
                    break;
                case ROW_EXPENSES_LOANS_NEW:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.loanExpenses.newLoans];
                    break;
                case ROW_EXPENSES_LOANS_OLD:
                    textCell.textField.text = [NSString stringWithFormat:@"(%.2f)", periodCashFlow.expenses.loanExpenses.oldLoans];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        default:
            break;
    }
}

@end
