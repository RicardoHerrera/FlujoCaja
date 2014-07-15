//
//  MainMenuViewController.h
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 27/05/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//
// Esto es una prueba para Jenkins Avantica
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MainMenuViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,
        UITextFieldDelegate>{
    
    NSArray *arrayData;
    BOOL isCreatingNew;
    
    NSString *strFlowName;
    
}

- (void) addGradient:(UIView *) aView;
- (IBAction)onTapAddFlow:(id)sender;
- (IBAction)onTapCancelAdd:(id)sender;

@property(nonatomic, retain) UITextField *txtFlowName;
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UICollectionView *theCollection;

@end
