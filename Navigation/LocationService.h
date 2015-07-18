//
//  LocationService.h
//  Navigation
//
//  Created by Giorgi Gogishvili on 7/18/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class LocationService;

@protocol LocationServiceDelegate <NSObject>

-(void) locationService:(LocationService *) manager didUpdateToLocation:(CLLocation *) newLocation fromLocation:(CLLocation *) oldLocation;

@end

@interface LocationService : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager * LocationManager;
}

@property (nonatomic, weak) id<LocationServiceDelegate> delegate;

+(LocationService *) getInstance;

-(void) startLocationService;
-(void) stopLocationService;


@end
