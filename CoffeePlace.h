//
//  CoffeePlace.h
//  CoffeShop4
//
//  Created by Matt Deuschle on 12/9/15.
//  Copyright © 2015 Matt Deuschle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CoffeePlace : NSObject

@property MKMapItem *mapItem;
@property float milesDifference;

@end
