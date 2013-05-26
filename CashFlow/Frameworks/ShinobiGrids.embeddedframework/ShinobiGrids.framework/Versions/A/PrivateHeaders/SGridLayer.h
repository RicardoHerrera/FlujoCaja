// SGridLayer.h
#import <UIKit/UIKit.h>

@class ShinobiGrid;
@class SGridCell;
@class SGridLayerContent;

typedef enum {
    SGridFreezeTypeNone,
    SGridFreezeTypeVertical,
    SGridFreezeTypeHorizontal,
    SGridFreezeTypeStatic
} SGridFreezeType;

@interface SGridLayer : UIScrollView {
    
}

@property (nonatomic, assign) ShinobiGrid *grid;
@property (nonatomic, retain) SGridLayerContent *content;
@property (nonatomic, assign) SGridFreezeType freezeType;

- (BOOL) shouldHaveBorder;

- (id) initWithFreeze:(SGridFreezeType) aFreezeType withGrid: (ShinobiGrid *) aGrid;
- (NSString *) freezeTypeDescription;
- (NSArray *) addedCells;
- (BOOL) topBounceNeedsClampingForOffset: (CGPoint) newContentOffset;
- (BOOL) leftBounceNeedsClampingForOffset: (CGPoint) newContentOffset;

@end
