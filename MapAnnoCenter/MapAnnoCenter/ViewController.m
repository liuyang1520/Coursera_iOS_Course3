//
//  ViewController.m
//  MapAnnoCenter
//
//  Created by Yang Liu on 2016-04-06.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISwitch *myLocationSwitch;
@property (strong, nonatomic) MKPointAnnotation *uofc;
@property (strong, nonatomic) MKPointAnnotation *banff;
@property (strong, nonatomic) MKPointAnnotation *downtown;
@property (strong, nonatomic) MKPointAnnotation *currentLocation;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (assign, nonatomic) BOOL isMoving;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addAnnos];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.currentLocation = [[MKPointAnnotation alloc] init];
    self.currentLocation.coordinate = CLLocationCoordinate2DMake(0, 0);
    self.isMoving = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchTapped:(id)sender {
    if (self.myLocationSwitch.isOn) {
        self.mapView.showsUserLocation = YES;
        [self.locationManager startUpdatingLocation];
    }
    else {
        self.mapView.showsUserLocation = NO;
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    self.isMoving = NO;
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    self.isMoving = YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.currentLocation.coordinate = locations.lastObject.coordinate;
    if (!self.isMoving)
        [self centerMapWithAnnoPoint:self.currentLocation];
}

- (IBAction)UofCButtonTapped:(id)sender {
    [self centerMapWithAnnoPoint:self.uofc];
}

- (IBAction)BanffButtonTapped:(id)sender {
    [self centerMapWithAnnoPoint:self.banff];
}

- (IBAction)DowntownButtonTapped:(id)sender {
    [self centerMapWithAnnoPoint:self.downtown];
}

- (void)addAnnos{
    self.uofc = [[MKPointAnnotation alloc] init];
    self.uofc.title = @"U of C";
    self.uofc.coordinate = CLLocationCoordinate2DMake(51.078187, -114.135790);
    
    self.banff = [[MKPointAnnotation alloc] init];
    self.banff.title = @"Banff";
    self.banff.coordinate = CLLocationCoordinate2DMake(51.178281, -115.570693);
    
    self.downtown = [[MKPointAnnotation alloc] init];
    self.downtown.title = @"Calgary DT";
    self.downtown.coordinate = CLLocationCoordinate2DMake(51.047780, -114.059227);
    
    [self.mapView addAnnotations:@[self.uofc, self.banff, self.downtown]];
}

- (void)centerMapWithAnnoPoint:(MKPointAnnotation *)annoPoint {
    [self.mapView setCenterCoordinate:annoPoint.coordinate animated:YES];
}

@end
