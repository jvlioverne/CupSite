//
//  GoogleMapsView.m
//  CupSite
//
//  Created by Benjas on 19/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import "GoogleMapsView.h"
#import <GoogleMaps/GoogleMaps.h>

NSString *strUserLocation;
float mlatitude;
float mlongitude;

GMSMapView *mapView;


@interface GoogleMapsView ()

@end

@implementation GoogleMapsView




- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnVerMapa.titleLabel.text =@"Ver Mapa";
    // Do any additional setup after loading the view.
    //-------------------------------------------------------------------------------
    //Location
    self.locationManager                    = [[CLLocationManager alloc] init];
    self.locationManager.delegate           = self;
    self.location                           = [[CLLocation alloc] init];
    self.locationManager.desiredAccuracy    = kCLLocationAccuracyKilometer;
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager  requestAlwaysAuthorization];
    
    [self.locationManager startUpdatingLocation];
    
    
}

- (void)paintMap
{
    //-------------------------------------------------------------------------------
    //Google Maps
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:mlatitude
                                                            longitude:mlongitude
                                                                 zoom:16];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.frame = CGRectMake(0, 0, self.ViewMap.frame.size.width, self.ViewMap.frame.size.height);
    mapView.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(mlatitude, mlongitude);
    marker.title = @"Usted está aqui";
    marker.snippet = @"A disfrutar la vista";
    marker.map = mapView;
    [self.ViewMap addSubview:mapView];
    
}




    //-------------------------------------------------------------------------------
   
    // Create a GMSCameraPosition that tells the map to display the
    
    // coordinate -33.86,151.20 at zoom level 6.
   // GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:mlatitude
   //                                                         longitude:mlongitude
     //                                                            zoom:10];
    //mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    //mapView_.myLocationEnabled = YES;
    //self.view = mapView_;
    
    // Creates a marker in the center of the map.
    //GMSMarker *marker = [[GMSMarker alloc] init];
    
    ///marker.position = CLLocationCoordinate2DMake(mlatitude, mlongitude);
    //marker.title = @"Usted está aqui";
    //marker.snippet = @"Disfrutar la vista";
    //marker.map = mapView_;
    

//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**********************************************************************************************
 Localization
 **********************************************************************************************/
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = locations.lastObject;
    NSLog( @"didUpdateLocation!");
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         for (CLPlacemark *placemark in placemarks)
         {
             NSString *addressName = [placemark name];
             NSString *city = [placemark locality];
             NSString *administrativeArea = [placemark administrativeArea];
             NSString *country  = [placemark country];
             NSString *countryCode = [placemark ISOcountryCode];
             NSLog(@"name is %@ and locality is %@ and administrative area is %@ and country is %@ and country code %@", addressName, city, administrativeArea, country, countryCode);
             strUserLocation = [[administrativeArea stringByAppendingString:@","] stringByAppendingString:countryCode];
             NSLog(@"gstrUserLocation = %@", strUserLocation);
         }
         mlatitude = self.locationManager.location.coordinate.latitude;
         //[mUserDefaults setObject: [[NSNumber numberWithFloat:mlatitude] stringValue] forKey: pmstrLatitude];
         mlongitude = self.locationManager.location.coordinate.longitude;
         //[mUserDefaults setObject: [[NSNumber numberWithFloat:mlatitude] stringValue] forKey: pmstrLatitude];
         NSLog(@"mlatitude = %f", mlatitude);
         NSLog(@"mlongitude = %f", mlongitude);
         //self.btnVerMapa.titleLabel.textColor = [UIColor blueColor];
         self.btnVerMapa.titleLabel.text =@"Ver Mapa";
         
     }];
    
    
}






- (IBAction)btnVerMapaPressed:(id)sender {
    [self paintMap];
}
@end
