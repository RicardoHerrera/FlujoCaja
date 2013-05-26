
#import "SDataGridRow.h"
#import "SGridRowStruct.h"

@interface SDataGridRow (hidden)

+ (id) rowFromRowStruct:(SGridRow) rowStruct;
- (SGridRow) internalRow;
@end
