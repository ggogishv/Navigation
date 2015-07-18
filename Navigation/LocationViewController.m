//
//  LocationViewController.m
//  Navigation
//
//  Created by Giorgi Gogishvili on 7/18/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [LocationService getInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getLocation:(id)sender
{
    [[LocationService getInstance] startLocationService];
}

-(void) locationService:(LocationService *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%f",newLocation.coordinate.latitude);
    NSLog(@"%f",newLocation.coordinate.longitude);
    
    [[LocationService getInstance] stopLocationService];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
