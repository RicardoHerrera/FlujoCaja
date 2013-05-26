// SGridCellPrivateInterface.h
#import <Foundation/Foundation.h>
#import "SGridCell.h"
#import "SGridMovableElement.h"
#import "SGridEventResponder.h"
#import "SGridOwnedElement.h"
#import "SGridDragDirection.h"
#import "SGridCellProtocolPrivate.h"
#import "SGridEventResponderPrivate.h"

@class SGridGradient;

@interface SGridCell () <SGridCell, SGridMovableElement, SGridOwnedElement, SGridEventResponder, SGridEventResponderPrivate>

@property (nonatomic, assign) ShinobiGrid *grid;

//Constructs in place a style that represents the current state of the cell. Any attribute that the cell knows it should not be using (for example a cell with useOwnBackgroundColour = NO knows that its backgroundColor is to be replaced by some other style layer) will return nil for that attribute.
- (SGridCellStyle*) currentStyle;
- (SGridCellStyle*) selectedStyleFromStylePrecedenceWithDefault:(SGridCellStyle *)defaultStyle;

//record the current style so we can revert to it later
- (void) recordDeselectedStyle;
- (void) setBackgroundColorPrivately:(UIColor *)backgroundColor;
- (void) applySelectedStyle:(SGridCellStyle*) style cacheDeselectedStyle:(BOOL)cacheDeselectedStyle;
- (void) applyDeselectedStyle;
- (void) setSelected:(BOOL)isSelected animated:(BOOL)animated needsDelegateCallBacksFor:(SGridDelegateCallbackType)callbackType;
- (void) setSelected:(BOOL)isSelected animated:(BOOL)animated withSelectedStyle:(SGridCellStyle*)style needsDelegateCallBacksFor:(SGridDelegateCallbackType)callbackType;
- (void) setSelected:(BOOL)isSelected;
- (void) pulse;

- (void) setGradient:(SGridGradient *)grad;

//return YES if this cell is in the last row of the section that it belongs to
- (BOOL) isInLastRowOfOwnSection;
- (BOOL) isInFirstRowOfOwnSection;
- (BOOL) isInLastSection;
- (BOOL) isInLastRowOfLastSection;
- (BOOL) isInLastRowOfLastUncollapsedSection;
- (BOOL) isInFirstRowOfFirstUncollapsedSection;

//sets the layer that the cell belongs to
- (void) setOwningLayer:(SGridLayer *) newSGridLayer;

//these methods are private as we are limiting the users ability to freeze cells to the methods 'freezeColsToTheLeftOfAndIncludingIndex:' and 'freezeRowsAboveAndIncludingIndex:'
- (BOOL) verticallyFrozen;
- (void) setVerticallyFrozen:(BOOL)freezeVertically;
- (BOOL) horizontallyFrozen;
- (void) setHorizontallyFrozen:(BOOL)freezeHorizontally;

@property (nonatomic, assign) SGridDragDirection currentDragDirection;
- (BOOL) beingDragged;

@property (nonatomic, retain, readwrite) SGridCoord *gridCoord;

@property (nonatomic, assign) BOOL useOwnBackgroundColor;
@property (nonatomic, retain) SGridCellStyle *deselectedStyle;

enum SGridSide;
- (void) addShadowOnSide:(enum SGridSide)side;
- (void) shadeIfFrozen;
- (void) showShadows:(BOOL)show;

//insets a given frame by the cell's borders
- (CGRect) insetFrame:(CGRect)frame;

- (BOOL) hasOwningGrid;

@end
