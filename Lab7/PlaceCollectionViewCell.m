//
//  PlaceCollectionViewCell.m
//  Lab7
//
//  Created by David Richardson on 11/11/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import "PlaceCollectionViewCell.h"

@interface PlaceCollectionViewCell()

@end

@implementation PlaceCollectionViewCell

- (void) setupCell: (NSDictionary *) place {
    
    self.place = place;
    
    NSString *imageFileName = [place valueForKey:@"Image"];
    self.placeImageView.image = [UIImage imageNamed:imageFileName];
    
    NSString *labelName = [place valueForKey:@"Name"];
    self.placeLabel.text = labelName;
    
}


@end
