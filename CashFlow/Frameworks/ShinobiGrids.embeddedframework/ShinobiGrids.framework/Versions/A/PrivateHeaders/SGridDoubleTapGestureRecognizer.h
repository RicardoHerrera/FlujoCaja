#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SGridDoubleTapGestureRecognizer : UITapGestureRecognizer

- (id) initWithTarget:(id)target action:(SEL)action UNAVAILABLE_ATTRIBUTE;

- (id)initWithTarget:(id)target
    initialTapAction:(SEL)initialAction
     doubleTapAction:(SEL)dtAction;

- (void) cancel;

@end
