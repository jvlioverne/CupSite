//
//  GoogleMapsView.h
//  CupSite
//
//  Created by Benjas on 19/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface GoogleMapsView : UIViewController<CLLocationManagerDelegate>

@property(strong, nonatomic)CLLocationManager   *locationManager;
@property(strong, nonatomic)CLLocation          *location;

@end
