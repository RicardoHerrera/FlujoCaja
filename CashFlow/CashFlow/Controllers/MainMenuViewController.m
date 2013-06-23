//
//  MainMenuViewController.m
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 27/05/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "MainMenuViewController.h"
#import "CashFlowService.h"
#import "CashFlow.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CashFlowService *cashService = [[CashFlowService alloc] init];
    
    arraryData = [[NSArray alloc] init];
    arraryData = [cashService getCashFlows];
}

#pragma mark CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [arraryData count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CashFlow" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    CashFlow *aCash = [arraryData objectAtIndex:indexPath.row];
    
    UILabel *lblName = [[UILabel alloc]
                        initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    lblName.text = aCash.name;
    lblName.font = [UIFont fontWithName:@"System" size:20.0f];
    [lblName setTextAlignment:NSTextAlignmentCenter];
    [lblName setCenter:CGPointMake(60, 40)];
    [lblName setNumberOfLines:2];
    [lblName setLineBreakMode:NSLineBreakByWordWrapping];
    [lblName setBackgroundColor:[UIColor clearColor]];
    
    [cell addSubview:lblName];
    
    
    return cell;
}
#pragma mark CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval = CGSizeMake(120, 120);
    
    return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
