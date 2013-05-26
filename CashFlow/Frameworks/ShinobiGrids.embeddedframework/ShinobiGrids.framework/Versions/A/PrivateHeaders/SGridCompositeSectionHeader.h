// SGridCompositeSectionHeader.h
#import <Foundation/Foundation.h>
#import "SGridEventResponder.h"
#import "SGridMovableElement.h"

@class SGridSectionHeader;
@class SGridSection;

@interface SGridCompositeSectionHeader : NSObject <SGridMovableElement> {
    NSString *frozenTitle, *liquidTitle;
    UIView   *frozenView,  *liquidView;
}

- (id) init UNAVAILABLE_ATTRIBUTE;
- (id) initWithOwningSection:(SGridSection *)owning;

@property(nonatomic, assign) SGridSection *owningSection;
@property (nonatomic, retain) UILabel *textLabel;

- (void) addHeader:(SGridSectionHeader *) headerToAdd asFrozen:(BOOL)frozen;

- (void) setFrozenTitle:(NSString *)frozenTitle;
- (void) setLiquidTitle:(NSString *)liquidTitle;
- (void) setFrozenView:( UIView *)frozenUIView;
- (void) setLiquidView:( UIView *)liquidUIView;

@property (nonatomic, assign) BOOL showShadow;

- (float)height;

/* Returns the composite frame. Note that a composite header is not actually a UIView subclass and so this function is for convenience only.*/
- (CGRect) compositeFrame;

- (BOOL) hasAllSubheaders;
- (void) removeSubHeaders;

- (SGridSectionHeader *) headerAtIndex:(NSUInteger) index;

@end
