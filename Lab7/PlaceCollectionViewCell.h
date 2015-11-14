//
//  PlaceCollectionViewCell.h
//  Lab7
//
//  Created by David Richardson on 11/11/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (strong, nonatomic) NSDictionary *place;

- (void) setupCell: (NSDictionary *) place;


@end
