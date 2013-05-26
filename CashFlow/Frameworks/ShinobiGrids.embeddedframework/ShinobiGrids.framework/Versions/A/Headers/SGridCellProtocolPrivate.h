//
//  SGridCellProtocol.h
//  ShinobiControls_Source
//
//  Created by Ryan Grey on 06/12/2012.
//
//

////#import <Foundation/Foundation.h>
@class SGridCellStyle;

@protocol SGridCell <NSObject>

// We include the interface here






/** @name Initialization */

/** Initializes a cell with a reuse identifier and returns it to the caller.
 @warning *Important* This method must be used to initialize a cell - using
 `init` or `initWithFrame` is not permitted.
 
 When subclassing a cell for use in a ShinobiDataGrid, ensure that you have
 overridden this constructor, as this is the method which the DataGrid will
 call when instantiating cells.
 
 */
- (id) initWithReuseIdentifier:(NSString *) identifier;



/** @name Content */

/** Setting this property to `YES` results in any added subviews having
 dimensions automatically applied so that they are the same size as the cell.
 Default value is `YES` for the grid and `NO` for the data-grid.
 */
@property (nonatomic, assign) BOOL fitSubviewsToView;

/** A readonly frame which represents the area available for content of the cell.
 The gridlines take up the remaining edges of the cell.
 */
@property (nonatomic, readonly) CGRect contentFrame;




/** @name Selection */


/** A boolean that indicates if this cell is selected or not.
 
 @return selected `YES` if this cell is selected. `NO` otherwise.
 */
@property (nonatomic, assign, readonly) BOOL selected;

/** Set this cell as being selected or deselected.
 
 @warning *Important* Note that programmatic cell selection ignores the grid's
 `selectionMode`, meaning that there will be no automatic deselection in any
 circumstances.
 
 @parameter isSelected `YES` if the cell should be set as selected.
 @parameter animated `YES` if this cell's selection change should be animated.
 */
- (void) setSelected:(BOOL)isSelected animated:(BOOL)animated;





/** @name Subclassing an SGridCell.
 
 It is unlikely that you will ever call these methods directly. However you may
 wish to override these methods to tailor the behaviour of SGridCell subclasses.
 */

/** This method is called before a cell is returned from the pool that it has
 been stored in. Any state that may need to be reset prior to it being retrieved
 from -[ShinobiGrid dequeueReusableCellWithIdentifier:] can be done inside this
 method.
 
 @warning *Important* This method is a potential performance hotspot as it is
 called every time a cell is retrieved as a result of a call to the data source
 method. For this reason you should only override this method to reset a property
 of this cell if changing said property within the datasource method is not
 applicable.
 */
- (void) resetForReuse;

@end
