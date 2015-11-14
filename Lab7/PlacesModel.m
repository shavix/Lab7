//
//  PlacesModel.m
//  Lab7
//
//  Created by David Richardson on 11/10/15.
//  Copyright © 2015 David Richardson. All rights reserved.
//

#import "PlacesModel.h"


// INTERFACE
@interface PlacesModel()

@property (strong, nonatomic) NSString *placesFilepath;


@end

static NSString *const kPlacesPList = @"places.plist";

// IMPLEMENTATION
@implementation PlacesModel

-(id) init {
    
    self = [super init];
    
    if(self){
        
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Places" ofType:@"plist"];
        
        _places = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        
        // if plist read in correctly
        if(_places){

        }
        
    }
    
    return self;
}

// class method
+(instancetype) sharedModel{
    static PlacesModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once (&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    return _sharedModel;
}






@end
