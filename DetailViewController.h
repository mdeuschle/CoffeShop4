//
//  DetailViewController.h
//  CoffeShop4
//
//  Created by Matt Deuschle on 12/10/15.
//  Copyright © 2015 Matt Deuschle. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "CoffeePlace.h"

@interface DetailViewController : UIViewController

@property CoffeePlace *coffePlace;
@property CLLocation *currentLocation;

@end
