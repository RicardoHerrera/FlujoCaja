#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



#define DEFAULT_DATAGRID_HEADER_CELL_HEIGHT        44
#define DEFAULT_DATAGRID_HEADER_CELL_FONT          @"HelveticaNeue-Bold"
#define DEFAULT_DATAGRID_HEADER_CELL_FONT_SZ       20
//#define DEFAULT_DATAGRID_HEADER_CELL_ALIGNMENT     Centre

#define DEFAULT_DATAGRID_SECTION_HEADER_HEIGHT        36
#define DEFAULT_DATAGRID_SECTION_HEADER_FONT          @"Helvetica-Bold"
#define DEFAULT_DATAGRID_SECTION_HEADER_FONT_SZ       20
#define DEFAULT_DATAGRID_SECTION_HEADER_INDENT_LEFT   26

#define DEFAULT_DATAGRID_CELL_HEIGHT        44
#define DEFAULT_DATAGRID_CELL_WIDTH         160
#define DEFAULT_DATAGRID_CELL_FONT          @"Helvetica"
#define DEFAULT_DATAGRID_CELL_FONT_SZ       18
#define DEFAULT_DATAGRID_CELL_INDENT_LEFT   22

#define DEFAULT_DATAGRID_BORDER_COLOR [UIColor grayColor]


@interface UIColor (hex)
+ (id) colorWithHex:(unsigned)hex alpha:(float)alpha;
@end

@class SDataGridCellStyle;
@class SDataGridSectionHeaderStyle;
@class SDataGridLineStyle;


/** A data-grid theme can set the initial styling properties of a data-grid for you to further customize if you wish. The data-grid comes with three preset themes and any data-grid that is rendered will ask the theme for the current set of colors and styles. 
 
 The three themes are:
 
   + iOS - Fits in nicely with the Apple styled UIKit controls
   + Light - Lighter and more neutral colors with subtle highlighting
   + Dark - Darker colors with bright highlighting
 
   The default theme is iOS theme. To change the theme that a data-grid is created with, you'll need to set the inital theme before you create the grid. The theme is set using the +setInitialTheme: method, passing in one of the `SDataGridInitialTheme` enum options: `SDataGridInitialThemeiOS`, `SDataGridInitialThemeLight`, `SDataGridInitialThemeDark`
 
 `+[SDataGridTheme setInitialTheme:SDataGridInitialThemeDark];`
 
 
 The colors and style objects are also available for the current initial-theme to allow you to modify certain aspects and apply them to the data-grid after you've rendered it.
 
 
 @warning *Important* This is the initial theme that all new data-grids will be created with. Setting this will not affect existing data-grids.
 
  
 */

@interface SDataGridTheme : NSObject

typedef enum
{
    SDataGridInitialThemeiOS,
    SDataGridInitialThemeLight,
    SDataGridInitialThemeDark,
} SDataGridInitialTheme;


#pragma mark -
#pragma mark Changing themes
/** @name Changing themes */
 
/** Sets the theme styling that all new data-grids will be created with.
 
Only applies to data-grids that are created after this is set. 
 
 <code> typedef enum
 {
 SDataGridInitialThemeiOS,
 SDataGridInitialThemeLight,
 SDataGridInitialThemeDark,
 } SDataGridInitialTheme;
 </code>
 
 */
+ (void) setInitialTheme:(SDataGridInitialTheme)initial;


#pragma mark -
#pragma mark Current initial-theme colors
/** @name Current initial-theme colors */

/** A UIColor representing the background color set for cells in this theme.
 
 Note: alternate row styling may be configured see initialThemeCellBackgroundColorAlternate
 */
+ (UIColor *) initialThemeCellBackgroundColor;

/** A UIColor representing the background color set for cells in this theme.
 
 Note: this is the alternate color, see also initialThemeCellBackgroundColor
 */
+ (UIColor *) initialThemeCellBackgroundColorAlternate;

/** A UIColor representing the background color set for selected cells in this theme. */
+ (UIColor *) initialThemeCellSelectionColor;

/** A UIColor representing the background color set for header cells in this theme.
 
 Note: header cells are defined per SDataGridColumn
 */
+ (UIColor *) initialThemeHeaderCellColor;

/** A UIColor representing the fill color set for section headers in this theme.
 */
+ (UIColor *) initialThemeSectionHeaderBackgroundColor;

/** A UIColor representing the font color set for section headers in this theme.
 */
+ (UIColor *) initialThemeSectionHeaderFontColor;

#pragma mark -
#pragma mark Current initial-theme styles
/** @name Current initial-theme styles */

/** The default style applied to rows when this theme is set initially
 
Note: alternate row styling may be configured see defaultAlternatingRowStyle */
+ (SDataGridCellStyle *) defaultRowStyle;

/** The default style applied to rows when this theme is set initially
 
 Note: this is the alternate row styling, see also defaultRowStyle */
+ (SDataGridCellStyle *) defaultAlternatingRowStyle;

/** The default style applied to selected cells when this theme is set initially
 */
+ (SDataGridCellStyle *) defaultSelectedCellStyle;

/** The default style applied to cells in the header row */
+ (SDataGridCellStyle *) defaultHeaderRowStyle;

/** The default style applied to the section header */
+ (SDataGridSectionHeaderStyle *) defaultSectionHeaderStyle;

/** The default style applied to grid lines */
+ (SDataGridLineStyle *) defaultGridLineStyle;


#pragma mark -
#pragma mark Private
+ (void) applySectionHeaderGradientLayer:(CAGradientLayer *)layer;



@end
