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
#import "FirstInputDataView.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

@synthesize txtFlowName;

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
    
    arrayData = [[NSArray alloc] init];
    arrayData = [cashService getCashFlows];
    
    txtFlowName = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 160, 60)];
    
    [txtFlowName setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    txtFlowName.textColor = [UIColor blackColor];
    txtFlowName.placeholder = @"Nombre del Flujo de caja";
    txtFlowName.textAlignment = NSTextAlignmentCenter;
    txtFlowName.font = [UIFont fontWithName:@"System" size:24.0f];
    txtFlowName.delegate = self;
    
    [self.view addSubview:txtFlowName];
    
    [txtFlowName setHidden:TRUE];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:TRUE];
    
    [self.theCollection reloadData];
    
}

#pragma mark CollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [arrayData count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CashFlow" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    CashFlow *aCash = [arrayData objectAtIndex:indexPath.row];
    
    UILabel *lblName = [[UILabel alloc]
                        initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    lblName.text = aCash.name;
    lblName.font = [UIFont fontWithName:@"System" size:20.0f];
    [lblName setTextAlignment:NSTextAlignmentCenter];
    [lblName setCenter:CGPointMake(50, 40)];
    [lblName setNumberOfLines:2];
    [lblName setLineBreakMode:NSLineBreakByWordWrapping];
    [lblName setBackgroundColor:[UIColor clearColor]];
    
    [cell addSubview:lblName];
    
    [self addGradient:cell];
    
    return cell;
}
#pragma mark CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isCreatingNew) {
        return;
    }
    // TODO: Select Item
    [self performSegueWithIdentifier:@"ToGrid" sender:self];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize retval = CGSizeMake(100, 100);
    
    return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

#pragma mark view style
- (void) addGradient:(UIView *) aView {
    
    // Add Border
    CALayer *layer = aView.layer;
    
    // Add Shine
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [layer addSublayer:shineLayer];
}

#pragma mark UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([ @"" isEqualToString:textField.text]) {
        return NO;
    }else{
        strFlowName = textField.text;
        [self performSegueWithIdentifier:@"ToCreateNewFlow" sender:self];
    }
    
    [self onTapCancelAdd:nil];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ToCreateNewFlow"])
    {
        // Get reference to the destination view controller
        FirstInputDataView *vc = [segue destinationViewController];
        
        [vc setState:1];
        [vc setFlowName:strFlowName];
        
    }
    
    
}

#pragma mark ontap Methods
- (IBAction)onTapAddFlow:(id)sender {
    
    isCreatingNew = TRUE;
    [txtFlowName setHidden:FALSE];
    
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonSystemItemCancel target:self action:@selector(onTapCancelAdd:)];
    
}

- (IBAction)onTapCancelAdd:(id)sender{
    
    [txtFlowName setHidden:TRUE];
    
    self.navItem.leftBarButtonItem = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
