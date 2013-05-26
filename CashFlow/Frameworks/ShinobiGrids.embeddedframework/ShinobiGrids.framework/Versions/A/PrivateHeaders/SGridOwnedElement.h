// SGridOwnedElement.h
#import <Foundation/Foundation.h>

@class SGridLayerContent;
@class SGridLayer;
@class ShinobiGrid;

@protocol SGridOwnedElement <NSObject>

//every gridElement (gridLine, cell, section) should have a reference back to the content pane, layer and grid that it belongs to
- (SGridLayerContent *) owningContentPane;
- (void)                setOwningLayer:(SGridLayer*) layer;
- (SGridLayer *)        owningLayer;
- (ShinobiGrid *)       owningGrid;

@end
