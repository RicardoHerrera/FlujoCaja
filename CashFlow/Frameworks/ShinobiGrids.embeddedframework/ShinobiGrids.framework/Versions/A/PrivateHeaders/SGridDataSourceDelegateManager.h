// SGridDataSourceDelegateManager.h
#import <Foundation/Foundation.h>
#import "SGridDataSource.h"
#import "SGridDelegate.h"
#import "SGridRowStruct.h"

@class SGridSection;

@interface SGridDataSourceDelegateManager : NSObject {
@private 
    int                          totalNumberOfColumnsInGrid;
    int                          totalNumberOfSectionsInGrid;
    int                          totalNumberOfRowsInGrid;
    NSMutableArray               *numberOfRowsInASection;
    NSMutableArray               *allSections;
    NSMutableDictionary          *colStyles;
    NSMutableDictionary          *rowStyles;
    NSMutableSet                 *emptySections;
    
    NSMutableArray               *horizontalGridLineStylesGroupedBySection;
    NSMutableArray               *verticalGridLineStyles;
    NSMutableDictionary          *headerStyles;
    
    NSMutableDictionary          *liquidSectionHeaderTitles;
    NSMutableDictionary          *frozenSectionHeaderTitles;
    
    NSMutableDictionary          *liquidSectionHeaderViews;
    NSMutableDictionary          *frozenSectionHeaderViews;
    
    BOOL respondsToDelegateColStyleSelector;
    BOOL respondsToDelegateRowStyleSelector;
    BOOL respondsToDelegateVerticalGridLineStyleSelector;
    BOOL respondsToDelegateHorizontalGridLineStyleSelector;
    BOOL respondsToDelegateSectionHeaderStyleSelector;
    
    BOOL respondsToDatasourceNumberOfSectionsSelector;
}

@property(nonatomic,assign,readonly) ShinobiGrid *owningGrid;

//data source
@property(nonatomic,assign) id<SGridDataSource> dataSource;

//delegate
@property(nonatomic,assign) id<SGridDelegate> delegate;

- (id)   initWithGrid:(ShinobiGrid *) grid;
- (void) prepareForReloadFlushingStyles:(BOOL)flushStyles refreshDatasource:(BOOL) refreshDatasource;

#pragma mark - Cell Cache
- (void) trimSectionsOfNonVisibleCells;

#pragma mark -
#pragma mark Data Source Wrapper Methods
- (void) assertDataSourceExists;
- (BOOL) hasDataSource;
- (int) totalNumberOfColumnsInGrid;
- (int) totalNumberOfSectionsInGrid;
- (int) totalNumberOfRowsInGrid;
- (int const) totalNumberOfCellsInGrid;
- (int) numberOfRowsInSection:(int) sectionIndex;
- (SGridRow) gridRowForRowWithAbsoluteIndex:(NSUInteger)absoluteIndex;
- (NSUInteger) absoluteIndexForGridRow:(SGridRow)row;
- (void) switchDraggingColWithColAtIndex:(int) indexOfColToSwitchWith withNewOriginOfColToSwitchWith:(float)newOriginOfColToSwitchWith fromCurrentState:(BOOL)fromCurrentState;
- (SGridCell *) loadAndRetrieveCellAtCol:(int)colIndex atRow:(SGridRow)row;

#pragma mark Sections
- (void) assertSectionsValid;
- (SGridSection *) sectionAtIndex:(int)sectionIndex;
- (UIView   *) sectionViewForLiquidSectionAtIndex:(int)sectionIndex inFrame:(CGRect)frame;
- (UIView   *) sectionViewForFrozenSectionAtIndex:(int)sectionIndex inFrame:(CGRect)frame;
- (NSString *) sectionTitleForLiquidSectionAtIndex:(int)sectionIndex;
- (NSString *) sectionTitleForFrozenSectionAtIndex:(int)sectionIndex;
- (BOOL) sectionIsEmpty:(int)section;

#pragma mark -
#pragma mark Delegate Wrapper Methods
- (NSArray*) unselectedStyleHierarchyForCell:(SGridCell*) cellForHierarchy;
- (BOOL) hasDelegate;
- (SGridColRowStyle *) styleOfCellAtCol:(int) colIndex;
- (SGridColRowStyle *) styleOfCellAtCol:(int) colIndex addToDictionary:(BOOL)add;
- (SGridColRowStyle *) styleOfCellAtRow:(SGridRow)row;
- (void) exchangeRowStyleAtRow:(SGridRow) draggingRow withRowStyleAtRow:(SGridRow) staticRow;
- (void) switchColStyleAtIndex:(int)firstColStyleIndex withColStyleAtIndex:(int) secondColStyleIndex;

//gridlines
- (SGridLineStyle *) gridLineStyleHorizontalAtIndex:(int)gridLineIndex inSection:(int)sectionIndex;
- (SGridLineStyle *) gridLineStyleVerticalAtIndex:(int)gridLineIndex;
- (float) gridLineSizeHorizontalAtIndex:(int)index inSection:(int)sectionIndex;
- (float) gridLineSizeVerticalAtIndex:(int)index;

//sections
- (SGridSectionHeaderStyle *) sectionHeaderStyleAtIndex:(int) sectionIndex;

//styling
- (void) redrawRows:(NSArray*) rows forceDataSourceCheck:(BOOL) checkDataSource;
- (void) redrawColsAtIndices:(NSArray *)colIndices forceDataSourceCheck:(BOOL) checkDataSource;
- (SGridCellStyle*) styleForCell:(SGridCell*) cellForStyle;

@end
