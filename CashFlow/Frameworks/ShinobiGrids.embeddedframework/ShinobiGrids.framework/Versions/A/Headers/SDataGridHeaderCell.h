//
//  SDataGridHeaderCell.h
//  ShinobiControls_Source
//
//  Created by Ryan Grey on 31/10/2012.
//
//

#import "SDataGridTextCell.h"

/** This cell type is used in a ShinobiDataGrid in order to populate the header row. Each column has a header cell that can be retrieved with the `headerCell` method on an `SDataGridHeaderColumn` object.
 
 This cell type cannot respond to edit events or double tap events by default. It is possible to change this behaviour via subclassing - see the Methods for Subclassing.
 
 The implementation of `coordinate` in this class returns `nil`.*/

@interface SDataGridHeaderCell : SDataGridTextCell

- (void) applyStyle:(SDataGridCellStyle *)style;

#pragma mark -
#pragma mark Methods for Subclassing

/** @name Methods for Subclassing.*/
/** Dictates whether the cell responds to double taps.
 
 The default value for this is NO.*/
- (BOOL) respondsToDoubleTap;

/** The space to be used between the sort arrow and text.*/
@property (nonatomic, assign, readonly) float spaceBetweenArrowAndText;

@end
