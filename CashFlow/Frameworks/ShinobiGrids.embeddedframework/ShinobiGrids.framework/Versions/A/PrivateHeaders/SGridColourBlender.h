//
//  SGridColourBlender.h
//  ShinobiControls_Source
//
//  Created by Ryan Grey on 12/12/2012.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SGridColourBlender : NSObject

//clears this blender of any colours currently stored
- (void) empty;
//store a colour to be blended
- (void) addColourToBlend:(UIColor*) colourToBlend;
//retrieve a blend of all the currently stored colours
- (UIColor*) getBlendedColour;

//dictates if this blender object returns a blended colour - if NO, then it returns the last added colour, otherwise a blend will be returned
@property (nonatomic, assign) BOOL shouldBlend;

@end
