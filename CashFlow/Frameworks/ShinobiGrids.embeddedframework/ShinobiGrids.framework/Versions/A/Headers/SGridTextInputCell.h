//
//  SGridTextInputCell.h
//  ShinobiControls_Source
//
//  Created by Ryan Grey on 09/01/2013.
//
//

#import "SGridCell.h"
@protocol SGridTextInputView;

@interface SGridTextInputCell : SGridCell

/** The amount of space to left indent the textField view.
 
 This cell calls this method when setFrame: is called to query how much space it should leave between the left hand edge of the cell and the textField.
 
 @return A float representing the left indent for the textField.*/
@property (nonatomic, assign) float leftIndentForTextView;

/** The amount of space to right indent the textField view.
 
 This cell calls this method when setFrame: is called to query how much space it should leave between the right hand edge of the cell and the textField.
 
 @return A float representing the right indent for the textField.*/
@property (nonatomic, assign) float rightIndentForTextView;

/** The amount of space to top indent the textField view.
 
 This cell calls this method when setFrame: is called to query how much space it should leave between the top edge of the cell and the textField.
 
 @return A float representing the top indent for the textField.*/
@property (nonatomic, assign) float topIndentForTextView;

/** The amount of space to bottom indent the textField view.
 
 This cell calls this method when setFrame: is called to query how much space it should leave between the bottom edge of the cell and the textField.
 
 @return A float representing the bottom indent for the textField.*/
@property (nonatomic, assign) float bottomIndentForTextView;

@end
