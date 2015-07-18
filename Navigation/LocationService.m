//
//  LocationService.m
//  Navigation
//
//  Created by Giorgi Gogishvili on 7/18/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService

static LocationService *sharedInstance = nil;

#pragma mark - Object Lifecycle

+(LocationService *) getInstance
{
    if (!sharedInstance)
        sharedInstance = [[LocationService alloc] init];
    return sharedInstance;
}

-(id) init
{
    if (self = [super init]) {
        
        LocationManager = [[CLLocationManager alloc] init];
        [LocationManager setDesiredAccuracy:kCLLocationAccuracyBest];

        if ([LocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            [LocationManager requestWhenInUseAuthorization];
        
        LocationManager.delegate = self;
        
    }
    return self;
}

-(void) startLocationService
{
    [LocationManager startUpdatingLocation];
}

-(void) stopLocationService
{
    [LocationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate Methods

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (self.delegate) {
        [self.delegate locationService:self didUpdateToLocation:newLocation fromLocation:oldLocation];
    }
    
//    NSLog(@"%f", newLocation.coordinate.latitude);
//    NSLog(@"%f", newLocation.coordinate.longitude);
}

@end
