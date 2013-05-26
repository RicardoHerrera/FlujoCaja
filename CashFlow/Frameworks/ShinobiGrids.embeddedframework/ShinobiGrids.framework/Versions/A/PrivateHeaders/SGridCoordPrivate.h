// SGridCoordPrivate.h
#import <Foundation/Foundation.h>
#import "SGridCoord.h"

@class SGridCoordMutable;

@interface SGridCoord (hidden)

- (SGridCoordMutable *) mutableCopy;
- (void) mutateColumnTo:(int) newCol;
- (void) mutateRowTo:(SGridRow) newRow;

@end
