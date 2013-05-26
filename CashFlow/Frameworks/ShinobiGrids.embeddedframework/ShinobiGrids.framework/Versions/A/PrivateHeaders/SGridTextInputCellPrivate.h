#import "SGridTextInputCell.h"

@interface SGridTextInputCell (hidden)

@property (nonatomic, retain, readonly) UIView <SGridTextInputView> *textInput;

- (void) prepareToAcceptEditEvents:(BOOL) acceptsEditEvents;

- (void) setupTextInput:(UIView <SGridTextInputView>*) textInput;

- (void) commitChangesToDelegate;
- (void) setTextInputFrame:(CGRect) newFrame;

- (BOOL) textInputShouldBeginEditing:(UIView*) textInput;
- (void) textInputDidEndEditing:     (UIView*) textInput;

- (BOOL) useOwnFont;
- (BOOL) useOwnTextColor;
- (BOOL) useOwnTextAlignment;

- (void) setTextColorPrivately:(UIColor*) color;
- (void) setTextAlignmentPrivately:(NSTextAlignment) textAlignment;
- (void) setFontPrivately:(UIFont*) font;

- (void) removeObserversFrom:(NSObject*) observed;
- (void) addObserversTo:(NSObject*) toObserve;

@end
