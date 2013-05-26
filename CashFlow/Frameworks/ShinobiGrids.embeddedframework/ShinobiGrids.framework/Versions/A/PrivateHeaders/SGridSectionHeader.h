// SGridSectionHeader.h
#import <UIKit/UIKit.h>
#import "SGridMovableElement.h"
#import "SGridEventResponder.h"
#import "SGridOwnedElement.h"

@class SGridSection;

@interface SGridSectionHeader : UILabel <SGridEventResponder, SGridMovableElement, SGridOwnedElement> {
@private
    SGridLayer     *owningLayer;
    SGridSection   *section;
    float          previousAlpha;
    BOOL           collapsed;
}

- (id)initWithLayer:(SGridLayer *) theOwningLayer withSection:(SGridSection *) aSection;

- (void) setView:(UIView *)view;

@end
