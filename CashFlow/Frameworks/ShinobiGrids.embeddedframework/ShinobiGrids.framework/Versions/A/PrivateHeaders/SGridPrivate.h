// SGridPrivateInterface.h
#import <Foundation/Foundation.h>

#import "SGrid.h"
#import "SGridMovableElement.h"
#import "SGridEventResponder.h"
#import "SGridEventResponderPrivate.h"
#import "SGridArrowOrientation.h"

@class SGridSection;
@class SGridCompositeSectionHeader;
@class SGridColourBlender;

void SGridPulseView(UIView *view, UIView *owner);

@interface ShinobiGrid ()

#pragma mark -
#pragma mark DataSource
////loadAndRetrieveCellAtCol:atRow: retrieves the cell whether it is visible or not - be wary of accidentally loading cells that aren't currently meant to be in view
- (SGridDataSourceDelegateManager *) dataSourceDelegateManager;
- (void)                      setZoomDelegate:(id<UIScrollViewDelegate>)d;
- (void)                      setPoolDequeCalled:(BOOL)dequeingtons;
- (BOOL)                      poolDequeCalled;
- (void)                      reloadInternal:(BOOL)internal;

#pragma mark -
#pragma mark Styling
- (NSArray*) unselectedStyleHierarchyForCell:(SGridCell*) cellForHierarchy;
- (SGridCellStyle*) blendedStyleFromHierarchy:(NSArray*) styles cellIsSelected:(BOOL) selected;
@property (nonatomic, assign) BOOL blendsDelegateRowStylesWithDefaultRowStyle;
@property (nonatomic, assign) BOOL ignoresDelegateColStylesForFirstRow;

- (float) colStyleSizeForColIndex:(NSInteger) colIndex;
- (float) rowStyleSizeForRow:(SGridRow) row;


#pragma mark -
#pragma mark Drawing and Layout
- (BOOL)                      initialLoad;
- (void)                      addCellToAppropriateLayer:(SGridCell*) cell;

#pragma mark -
#pragma mark Layers

- (SGridLayer *) verticallyFrozenLayer;
- (SGridLayer *) horizontallyFrozenLayer;
- (SGridLayer *) staticLayer;
- (SGridLayer *) liquidLayer;

#pragma mark -
#pragma mark Grid Dimensions
- (float)                     currentContentHeightForAllSections;

#pragma mark -
#pragma mark Sections
- (SGridSection *)            lastUncollapsedSection;
- (SGridSection *)            firstUncollapsedSection;
- (void)                      decrementNumberOfCollapsedSections;
- (void)                      setASectionIsCollapsing:(BOOL) sectionIsCollapsing;

#pragma mark -
#pragma mark Selection and Editing
////last "used" cell, e.g. with editing or main cell when dragging. nil if no cell currently editing/dragging
@property (nonatomic, retain) SGridCoord *userPrimaryCellCoord;

- (void) clearAllSelectedRowsWithAnimation: (BOOL)animate withDelegateCallbacksFor:(SGridDelegateCallbackType) callbackType queueIfInvalid:(BOOL) queueIfInvalid;
- (void)                      recordGridCoord:(SGridCoord*) gridCoord asSelected:(BOOL) isSelected;
- (id<SGridEventResponder, SGridEventResponderPrivate>)  searchLayer:(SGridLayer *) layer forResponderThatContainsPoint:(CGPoint) pointToSearchFor;
- (void)                      setLayersUserInteractionEnabled:(BOOL) enabled;

#pragma mark -
#pragma mark Reordering Columns/Rows/Cells
- (void)                      animateGridElement:(id<SGridMovableElement>)line toPosition:(CGPoint)position inFront:(BOOL)inFront fromCurrentState:(BOOL)fromCurrentState;
- (BOOL)                      reordering;
- (SGridCoordMutable *)       draggingIndex;

#pragma mark -
#pragma mark Methods for Managing Infinite Grid
- (void)     removeSectionFromVisibleRows:(int) sectionIndex;
- (int)      visibleColIndexFromActualIndex:(int) index;
- (int)      firstVisibleColumnIndex;
- (SGridRow) firstVisibleRow;
- (SGridRow) lastVisibleRow;


#pragma mark -
#pragma mark Exported methods for Testing
typedef enum SGridGestureType {
    SGridGestureTypeTapSingle,
    SGridGestureTypeTapDouble,
    SGridGestureTypeLongPress,
} SGridGestureType;

- (float) widthOfVerticalGridLineAtIndex:(NSUInteger) index;
- (float) widthOfLeftBorder;

#pragma mark - Frozen
@property (nonatomic, assign, readonly) SGridRow lastFrozenRow;

- (void) prepareNewCell:(SGridCell *)loadingCell
                atPoint:(CGPoint)origin
               atColumn:(int)colIndex
                 andRow:(SGridRow)row;
- (CGPoint) originOfCell:(SGridCell*) cellNeedingOrigin;


#pragma mark - For Testing
- (void) handleGesture:(SGridGestureType const) gesture
          forResponder:(id<SGridEventResponder, SGridEventResponderPrivate>) tappedElement;

- (void)handleTenativeSingleTap:(SGridDoubleTapGestureRecognizer *)gesture;

- (void) directionLockContentOffset:(CGPoint *)pContentOffset;

- (void) fakePanDecision:(SGridPanDecision)dec andLastContentOffset:(CGPoint)offset;

- (SGridPanDecision) internalPanDecision;

- (SGridDragDirection) decideIfColOrRowDrag;

@end

