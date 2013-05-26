#import "SGridMovableElement.h"
#import "SDataGridCell.h"
#import "SGridCellProtocolPrivate.h"

#import "SGridEventResponderPrivate.h"

@class SDataGridColumn;
@class SGridCell;

@interface SDataGridCell () <SGridCell, SGridMovableElement, SGridEventResponderPrivate /*other methods from the other protocols that SGridCell conforms to will be automatically forwarded on*/>

+ (Class)internalCellType;
- (SGridCell*)internalCell;

- (void) setCoordinate:(SDataGridCoord*) coord;

@end
