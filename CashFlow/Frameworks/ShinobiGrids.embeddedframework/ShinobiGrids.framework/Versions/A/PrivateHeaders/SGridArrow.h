#import <UIKit/UIKit.h>
#import "SGridArrowOrientation.h"

@class SGridCell;

@interface SGridArrow : UIImageView {
    SGridArrowOrientation orientation;
    CGPoint futureCenter;
	CGSize cellSize;
}

- (id) initWithOrientation:(SGridArrowOrientation)initOrientation withImage:(UIImage*) imageForArrow userControlsOrientation:(BOOL) userControlsOrientation;

- (void) addToCell:(SGridCell *)cell;

- (void) pulse;
- (void) fadeTo:(float) alpha;

@end
