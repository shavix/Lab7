//
//  PlacesModel.h
//  Lab7
//
//  Created by David Richardson on 11/10/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlacesModel : NSObject{
    
}
@property (retain, nonatomic) NSMutableArray *places;


+ (instancetype) sharedModel;


@end
