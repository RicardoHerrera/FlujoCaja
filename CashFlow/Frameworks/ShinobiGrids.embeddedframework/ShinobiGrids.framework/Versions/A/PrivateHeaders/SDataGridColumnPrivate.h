#import "SDataGridColumn.h"
@class ShinobiDataGrid;

@interface SDataGridColumn (hidden)

- (NSString*) sortOrderToString;
- (ShinobiDataGrid*) owningGrid;
- (void) setOwningGrid:(ShinobiDataGrid*) grid;

- (SDataGridColumnSortOrder) nextSortOrderAccordingToSortMode;

@end
