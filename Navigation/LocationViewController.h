//
//  LocationViewController.h
//  Navigation
//
//  Created by Giorgi Gogishvili on 7/18/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationService.h"

@interface LocationViewController : UIViewController <LocationServiceDelegate>

-(IBAction)getLocation:(id)sender;

@end
