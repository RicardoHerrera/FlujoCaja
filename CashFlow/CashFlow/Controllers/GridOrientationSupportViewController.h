//
//  GridOrientationSupportViewController.h
//  CashFlow
//
//  Created by Alex Gutierrez on 6/23/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridOrientationSupportViewController : UIViewController

@property (strong, nonatomic) ShinobiDataGrid *grid;

- (void)setupGrid;
- (void)fixupGridWithOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (CGRect)gridFrameForOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
