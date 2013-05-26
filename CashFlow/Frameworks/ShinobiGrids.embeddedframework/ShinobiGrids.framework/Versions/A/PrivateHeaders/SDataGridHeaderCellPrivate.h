#import "SDataGridHeaderCell.h"
#import "SGridSortOrderArrow.h"

@interface SDataGridHeaderCell (hidden)

- (void) showArrowForSortOrder:(SDataGridColumnSortOrder)sortOrder sortMode:(SDataGridColumnSortMode)mode;

- (SGridSortOrderArrow*) sortArrow;
- (void) setSortArrow:(SGridSortOrderArrow *) sortArrow;

@end
