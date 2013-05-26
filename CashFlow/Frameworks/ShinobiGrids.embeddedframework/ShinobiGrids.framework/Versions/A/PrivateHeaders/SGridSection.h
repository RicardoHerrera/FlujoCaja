// SGridSection.h
#import <UIKit/UIKit.h>
#import "SGridMovableElement.h"
#import "SGridRowStruct.h"
#import "SGridDelegate.h"

@class SGridCell;
@class SGridCompositeSectionHeader;
@class SGridColRowStyle;
@class SGridCoord;

@interface SGridSection : NSObject {
@private
    ShinobiGrid         *owningGrid;
    int                  index;
    
    NSMutableArray      *visibleRows;
    
    int                  lastFrozenRow;
    BOOL                 visibleRowsNeedSorted;
}

@property(nonatomic, readonly, getter = isCollapsed) BOOL collapsed;
@property(nonatomic, readonly)                       int  index;
@property(nonatomic, assign)                         ShinobiGrid *owningGrid;

//init
- (id)    initWithGrid:(ShinobiGrid *) theOwningGrid withIndex:(int) sectionIndex;

//dimensions
- (int)   numberOfCols;
- (int)   numberOfRows;
- (SGridRow) lastPossibleRowInSection;
- (float) loadRowStylesAndReturnSectionHeight;

/* Returns the total height of this current section - if the section is collapsed then the height of the header only will be returned, otherwise the height of all rows, headers and horizontal gridlines will be returned.*/
- (float) currentContentHeight;
- (float) expandedContentHeight;
- (float) sumOfRowHeights;
- (void) collectNumberOfUnspecifiedHeights: (int   *)numberOfUnspecifiedHeights
                       andSpecifiedHeights: (float *)sumOfSpecifiedHeights  
               andNumberOfSpecifiedHeights: (int   *)numberOfSpecifiedHeights;

//headers
@property (nonatomic, retain) SGridCompositeSectionHeader *header;

//collapse/expand
- (void) collapseOrExpandProgrammatic:(BOOL)programmatic withCompletion:(void(^)(void))completionBlock;
- (void) collapseWithCompletion:(void(^)(void))completionBlock;
- (void) expandWithCompletion:(void(^)(void))completionBlock;

//add/remove/get cells
- (void) addCell:(SGridCell *)cellToAdd;
- (void) replaceRow:(NSArray *) rowToReplace withRow:(NSArray *) replaceRowWith;
- (void) prepareForReload;
- (SGridCell *) visibleCellAtCol:(int) colIndex atRowIndex:(int) rowIndex;
- (int)  indexOfCellForThisSection:(SGridCell *) cellForIndex;
- (NSArray *) visibleCells;

//switching columns
- (void) switchDragginColWithColAtIndex:(int)colToSwitchWith 
         withNewOriginOfColToSwitchWith:(float) newOriginOfColToSwitchWith 
                       fromCurrentState:(BOOL) fromCurrentState;


- (BOOL) containsFrozenRows;

#pragma mark -
#pragma mark Methods for Managing Infinite Scrolling
- (NSArray*) getRow:(SGridRow)rowToGet;
- (void) removeRow:(SGridRow) rowToRemove removeFromView:(BOOL) removeFromView;
- (void) removeColAtIndex:(int)colIndexToRemove removeFromView:(BOOL) removeFromView;

#pragma mark - Cell/Row Cache
- (void) sortVisibleRows;
- (void) discardAllRowsExcept:(NSArray*) rowsToKeep;
- (void) discardAllColumnsExcept:(NSArray*) colIndicesToKeep;

@end
