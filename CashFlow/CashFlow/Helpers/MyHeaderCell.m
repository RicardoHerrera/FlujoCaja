//
//  MyCheckBoxCell.m
//  CustomCheckBoxCellDemo
//
//  Created by Jan Akerman on 09/04/2013.
//  Copyright (c) 2013 ShinobiControls. All rights reserved.
//

#import "MyHeaderCell.h"

#define CHECKBOX_IMAGE_SIZE CGSizeMake(200, 32)

@implementation MyHeaderCell {
    UIImageView *_checkBox;
    int codPeriodo;
}

-(id)initWithReuseIdentifier:(NSString *)identifier {
    if (self = [super initWithReuseIdentifier:identifier]) {
        
        // Load in tick images.
        // Checkbox images courtesy of http://www.visualpharm.com
        
        // Initialise the checkbox with the off image and the correct size.
        _checkBox = [[UIImageView alloc] init];
        _checkBox.frame = CGRectMake(0, 0, CHECKBOX_IMAGE_SIZE.width, CHECKBOX_IMAGE_SIZE.height);
        _checkBox.userInteractionEnabled = YES;
        [self addSubview:_checkBox];
        
        // Add a tap gesture recognizer that will toggle our check box on and off.
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggle)];
        [_checkBox addGestureRecognizer:tapRecognizer];
        
    }
    return self;
}

// This method is called when the cell is added to the grid. We need to take this opportunity to position our check box where we want it - in the center of our cell.
-(void)layoutSubviews {
    _checkBox.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}

// This is the method that will be called by our tap gesture recognizer on our check box.
- (void)toggle {
    
    // Toggle the check box's state.
    [self setChecked:TRUE];

    // If our custom cell has a delegate then we need to notify it that the cell has changed.
    if ([self.myHeaderCellDelegate respondsToSelector:@selector(myHeaderCellDidChange:)])
        [self.myHeaderCellDelegate myHeaderCellDidChange:self];
}

#pragma -Public Methods

// Set the check box's state according to the given parameter.
-(void)setChecked:(BOOL)checked {
    
    NSLog(@"codigo de periodo: %d", codPeriodo);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"hola" message:@"hola" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
}

@end
