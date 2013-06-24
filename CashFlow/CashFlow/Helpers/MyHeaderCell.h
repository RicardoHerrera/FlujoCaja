//
//  MyCheckBoxCell.h
//  CustomCheckBoxCellDemo
//
//  Created by Jan Akerman on 09/04/2013.
//  Copyright (c) 2013 ShinobiControls. All rights reserved.
//

#import <ShinobiGrids/SDataGridHeaderCell.h>

@class MyHeaderCell;

@protocol MyHeaderDelegate <NSObject>

-(void)myHeaderCellDidChange:(MyHeaderCell *)checkBox;

@end

@interface MyHeaderCell : SDataGridHeaderCell

@property (nonatomic, weak) id<MyHeaderDelegate> myHeaderCellDelegate;
@property (nonatomic, assign) int codPeriod;

@end


