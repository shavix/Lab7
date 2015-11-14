//
//  CollectionViewController.m
//  Lab7
//
//  Created by David Richardson on 11/11/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import "CollectionViewController.h"
#import "PlacesModel.h"
#import "PlaceCollectionViewCell.h"
#import "PlaceDetailViewController.h"

@interface CollectionViewController ()

@property (strong, nonatomic) NSMutableArray *places;
@property (strong, nonatomic) NSMutableArray *cellArray;
@property (strong, nonatomic) PlacesModel *placesModel;

@end

static int placesIndex;

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.placesModel = [PlacesModel sharedModel];
    self.places = self.placesModel.places;
    
    self.cellArray = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
    
    NSIndexPath *indexPath = [indexPaths firstObject];
    
    PlaceCollectionViewCell *cell = (PlaceCollectionViewCell *) [self.collectionView cellForItemAtIndexPath:indexPath];
    
    PlaceDetailViewController *detailViewController = segue.destinationViewController;
    
    detailViewController.place = cell.place;
        
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _places.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    PlaceCollectionViewCell *cell = (PlaceCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Place" forIndexPath:indexPath];
    
    [self.cellArray insertObject:cell atIndex:placesIndex];
    
    // Configure the cell
    [cell setupCell:_places[placesIndex++]];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 10, 0, 10);
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) [self.collectionView collectionViewLayout];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    } else {
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
}

/*
- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
}
*/

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
