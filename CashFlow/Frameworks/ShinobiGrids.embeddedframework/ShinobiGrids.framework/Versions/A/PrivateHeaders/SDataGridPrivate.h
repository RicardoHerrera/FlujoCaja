#import "SDataGrid.h"
#import "SGridDelegate.h"
#import "SGridDataSource.h"

@class SDataGridHeaderCell;

@interface ShinobiDataGrid () <SGridDataSource, SGridDelegate>

#pragma mark -
#pragma mark Col Config
- (void) commonInit;

#pragma mark -
#pragma mark Internals
- (ShinobiGrid*) internalGrid;

- (SDataGridHeaderCell *)        visibleHeaderCellAtColIndex:(NSUInteger) colIndex;

#pragma mark -
#pragma mark Exported methods for Testing
- (float) widthOfVerticalGridLineAtIndex:(NSUInteger) index;
- (float) widthOfLeftBorder;

#pragma mark -
#pragma mark Unpublished convenience methods
- (SDataGridCell *)visibleCellAtCol:(int)col andRow:(SDataGridRow *)row;

@end
