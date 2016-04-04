//
//  ViewController.m
//  WebMapLayoutTest
//
//  Created by Yang Liu on 2016-04-04.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ucalgary.ca/"]]];
    
    double latitude = 51.078173;
    double longitude = -114.135801;
    
    MKPointAnnotation *ucAnno = [[MKPointAnnotation alloc] init];
    ucAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    ucAnno.title = @"University of Calgary";
    [self.mapView addAnnotation:ucAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(ucAnno.coordinate, 5000, 5000);
    MKCoordinateRegion adjust = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjust animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
