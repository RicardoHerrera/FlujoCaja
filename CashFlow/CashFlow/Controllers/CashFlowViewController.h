//
//  CashFlowViewController.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/8/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CashFlow.h"
#import "GridOrientationSupportViewController.h"
#import "MyHeaderCell.h"
#import "ActionSheetPicker.h"

@interface CashFlowViewController : GridOrientationSupportViewController{
    NSMutableArray *arrayFlujos;
}

@property (strong, nonatomic) CashFlow *cashFlow;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *viewModeButton;

- (IBAction)onTapModify:(id)sender;
- (void)flowWasSelected:(NSNumber *)selectedIndex element:(id)element;
- (void)actionPickerCancelled:(id)sender;

- (void)updateArray:(NSNotification *)notification;

@end
