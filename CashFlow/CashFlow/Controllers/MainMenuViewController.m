//
//  MainMenuViewController.m
//  CashFlow
//
//  Created by Ricardo Herrera Valle on 27/05/13.
//  Copyright (c) 2013 UPCFinance. All rights reserved.
//

#import "MainMenuViewController.h"
#import "CashFlowService.h"

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
    
    
    NSLog(@"%@", [cashService getCashFlows]);
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
    cell.backgroundColor = [UIColor whiteColor];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
