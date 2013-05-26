// SGridLayerContent.h
#import <UIKit/UIKit.h>
#import "SGridEventResponder.h"
#import "SGridMovableElement.h"

@class SGridSection;

@interface SGridLayerContent : UIView {
}

@property (nonatomic, retain) SGridLayer            *owningLayer;
@property (nonatomic, retain) NSMutableSet          *selectableGridElements;

- (id)   initWithLayer:(SGridLayer *) theOwningLayer;
- (void) addCell:(SGridCell *)cellToAdd;
- (void) removeCell:(SGridCell *) removeCell;
- (void) removeGridLinesAndSectionHeadersFromView;
- (void) generateSectionHeadersForSection:(SGridSection *)section atOrigin:(float) yOrigin;
- (void) prepareForReload;

@end
