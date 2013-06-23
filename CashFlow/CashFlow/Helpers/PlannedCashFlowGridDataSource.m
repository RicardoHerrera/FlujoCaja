//
//  PlannedCashFlowGridDataSource.m
//  CashFlow
//
//  Created by Alex Gutierrez on 6/23/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "PlannedCashFlowGridDataSource.h"
#import "PeriodPlannedCashFlow.h"
#import "ProcessedCashFlow.h"
#import "PeriodPlannedCashFlowSummary.h"
#import "PeriodPlannedExpenses.h"
#import "PeriodPlannedIncomes.h"

#define ROW_INCOMES_INCOME_COLLECTIONS 0
#define ROW_INCOMES_NEW_LOANS 1
#define ROW_INCOMES_TOTAL 2

#define ROW_EXPENSES_RAW_MATERIALS_ASSETS_PURCHASES 0
#define ROW_EXPENSES_MANPOWER 1
#define ROW_EXPENSES_SALARIES 2
#define ROW_EXPENSES_ADMINISTRATIVE_EXPENSES 3
#define ROW_EXPENSES_SALES_COMMISSIONS 4
#define ROW_EXPENSES_DIVIDENDS 5
#define ROW_EXPENSES_LOANS 6
#define ROW_EXPENSES_INCOME_TAXES 7
#define ROW_EXPENSES_IGV 8
#define ROW_EXPENSES_TOTAL 9

#define ROW_SUMMARY_NET_INCOMES_EXPENSES 0
#define ROW_SUMMARY_START_BALANCE 1
#define ROW_SUMMARY_END_BALANCE 2

@interface PlannedCashFlowGridDataSource ()

@property (strong, nonatomic) ProcessedCashFlow *processedCashFlow;

@end

@implementation PlannedCashFlowGridDataSource

#pragma mark -
#pragma mark Shinobi Data Grid Protocols

- (NSUInteger) numberOfSectionsInShinobiDataGrid:(ShinobiDataGrid *) grid
{
    return 3;
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
        case 2:
            title = @"Flujo de caja";
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
            numberOfRows = 3;
            break;
        case 1:
            numberOfRows = 10;
            break;
        case 2:
            numberOfRows = 3;
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
    else {
        [self preparePeriodCellForDisplay:cell withCoordinates:coordinates andPeriodNumber:coordinates.column.tag];
    }
}


#pragma mark -
#pragma mark Protected Methods

- (void)prepareEntryCellForDisplay:(SDataGridCell *)cell withCoordinates:(SDataGridCoord *)coordinates
{
    NSInteger section = coordinates.row.sectionIndex;
    NSInteger row = coordinates.row.rowIndex;
    
    SDataGridTextCell *textCell = (SDataGridTextCell*)cell;

    switch (section) {
        case 0:
            switch (row) {
                case ROW_INCOMES_INCOME_COLLECTIONS:
                    textCell.textField.text = @"Ingresos por cobranzas";
                    break;
                case ROW_INCOMES_NEW_LOANS:
                    textCell.textField.text = @"Nuevo préstamo";
                    break;
                case ROW_INCOMES_TOTAL:
                    textCell.textField.text = @"Total INGRESOS";
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 1:
            switch (row) {
                case ROW_EXPENSES_RAW_MATERIALS_ASSETS_PURCHASES:
                    textCell.textField.text = @"Materia prima / activos";
                    break;
                case ROW_EXPENSES_MANPOWER:
                    textCell.textField.text = @"Mano de obra";
                    break;
                case ROW_EXPENSES_SALARIES:
                    textCell.textField.text = @"Sueldos";
                    break;
                case ROW_EXPENSES_ADMINISTRATIVE_EXPENSES:
                    textCell.textField.text = @"Gastos administrativos";
                    break;
                case ROW_EXPENSES_SALES_COMMISSIONS:
                    textCell.textField.text = @"Comisiones de ventas";
                    break;
                case ROW_EXPENSES_DIVIDENDS:
                    textCell.textField.text = @"Dividendos";
                    break;
                case ROW_EXPENSES_LOANS:
                    textCell.textField.text = @"Préstamos";
                    break;
                case ROW_EXPENSES_INCOME_TAXES:
                    textCell.textField.text = @"Impuestos a la renta";
                    break;
                case ROW_EXPENSES_IGV:
                    textCell.textField.text = @"Diferencia a pagar por IGV";
                    break;
                case ROW_EXPENSES_TOTAL:
                    textCell.textField.text = @"Total EGRESOS";
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 2:
            switch (row) {
                case ROW_SUMMARY_NET_INCOMES_EXPENSES:
                    textCell.textField.text = @"Ingreso / Egreso neto";
                    break;
                case ROW_SUMMARY_START_BALANCE:
                    textCell.textField.text = @"Fondos al iniciar el mes";
                    break;
                case ROW_SUMMARY_END_BALANCE:
                    textCell.textField.text = @"Fondos al finalizar el mes";
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
    
    PeriodPlannedCashFlow *firstPeriodPlannedCashFlow = self.processedCashFlow.periodPlannedCashFlows[0];
    
    switch (section) {
        case 2:
            switch (row) {
                case ROW_SUMMARY_END_BALANCE:
                    textCell.textField.text = [NSString stringWithFormat:@"%.2f", firstPeriodPlannedCashFlow.cashFlowSummary.endBalance];
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
    
    PeriodPlannedCashFlow *periodPlannedCashFlow = self.processedCashFlow.periodPlannedCashFlows[periodNumber];
    
    switch (section) {
        case 0:
            switch (row) {
                case ROW_INCOMES_INCOME_COLLECTIONS:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.incomes.incomeCollections];
                    break;
                case ROW_INCOMES_NEW_LOANS:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.incomes.newLoans];
                    break;
                case ROW_INCOMES_TOTAL:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.incomes.total];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 1:
            switch (row) {
                case ROW_EXPENSES_RAW_MATERIALS_ASSETS_PURCHASES:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.rawMaterialsAndAssetsPurchases];
                    break;
                case ROW_EXPENSES_MANPOWER:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.manpower];
                    break;
                case ROW_EXPENSES_SALARIES:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.salaries];
                    break;
                case ROW_EXPENSES_ADMINISTRATIVE_EXPENSES:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.administrativeExpenses];
                    break;
                case ROW_EXPENSES_SALES_COMMISSIONS:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.salesCommissions];
                    break;
                case ROW_EXPENSES_DIVIDENDS:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.dividends];
                    break;
                case ROW_EXPENSES_LOANS:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.loans];
                    break;
                case ROW_EXPENSES_INCOME_TAXES:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.incomeTaxes];
                    break;
                case ROW_EXPENSES_IGV:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.igv];
                    break;
                case ROW_EXPENSES_TOTAL:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.expenses.total];
                    break;
                default:
                    textCell.textField.text = @"";
                    break;
            }
            break;
        case 2:
            switch (row) {
                case ROW_SUMMARY_NET_INCOMES_EXPENSES:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.cashFlowSummary.netIncomesExpenses];
                    break;
                case ROW_SUMMARY_START_BALANCE:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.cashFlowSummary.startBalance];
                    break;
                case ROW_SUMMARY_END_BALANCE:
                    textCell.textField.text = [self textCellStringWithAmmount:periodPlannedCashFlow.cashFlowSummary.endBalance];
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
