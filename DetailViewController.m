//
//  DetailViewController.m
//  CoffeShop4
//
//  Created by Matt Deuschle on 12/10/15.
//  Copyright © 2015 Matt Deuschle. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.coffePlace.mapItem.name;
    [self getPathDirections:self.currentLocation.coordinate withDestination:self.coffePlace.mapItem.placemark.location.coordinate];
}

-(void)getPathDirections:(CLLocationCoordinate2D)source withDestination:(CLLocationCoordinate2D)destiation;
{
    MKPlacemark *placemarkSrc = [[MKPlacemark alloc] initWithCoordinate:source addressDictionary:nil];
    MKMapItem *mapItemSrc = [[MKMapItem alloc] initWithPlacemark:placemarkSrc];

    MKPlacemark *placemarkDest = [[MKPlacemark alloc] initWithCoordinate:destiation addressDictionary:nil];
    MKMapItem *mapItemDest = [[MKMapItem alloc] initWithPlacemark:placemarkDest];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];

    [request setSource:mapItemSrc];
    [request setDestination:mapItemDest];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    request.requestsAlternateRoutes = NO;

    MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        MKRoute *route = response.routes.lastObject;

        NSString *allSteps = [NSString new];

        for (int i = 0; i < route.steps.count ; i++) {

            MKRouteStep *step = [route.steps objectAtIndex:i];
            NSString *newStepString = step.instructions;
            allSteps = [allSteps stringByAppendingString:newStepString];
            allSteps = [allSteps stringByAppendingString:@"\n\n"];
        }

        self.textView.text = allSteps;
    }];

}

@end
