// SGridLineStyle.h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** An object of type SGridLineStyle represents the style that is to be a applied to a gridline in a ShinobiGrid object. */

@interface SGridLineStyle : NSObject


//Note that we need to use 'include' rather than 'import' so that the header file is actually included in both required files


/**
 @name Creation
 */

/** Creates and returns an object which represents the style of a gridline with
 default properties.
 
 Default values are a width of `3.f` and a black color.
 */
+ (id)style;

/** Creates and returns an object which represents the style of a gridline with
 the supplied properties
 
 @param width The width in pixels of the gridline
 @param color The color of the gridline
 */
+ (id)styleWithWidth:(float)width withColor:(UIColor *)color;


/**
 @name Initialization
 */

/** Initializes a newly allocated object that represents the style of a gridline
 with default values.
 
 Default values are a width of `3.f` and a black color.
 */
- (id) init;

/** Initializes a newly allocated object that represents the style of a gridline
 with the supplied properties.
 
 @param width The width in pixels of the gridline
 @param color The color of the gridline
 */
- (id) initWithWidth:(float)width withColor:(UIColor *)color;


/**
 @name Styling
 */

/**
 The width in pixels of the gridline that has this style applied to it.
 The minimum width that can be displayed is 1.0f
 */
@property (nonatomic, assign) float width;

/**
 The color of the gridline that has this style applied to it.
 */
@property (nonatomic, retain) UIColor *color;

@end
