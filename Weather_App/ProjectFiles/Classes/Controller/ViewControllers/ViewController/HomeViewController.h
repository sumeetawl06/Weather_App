//
//  ViewController.h
//  Weather_App
//
//  Created by reliancegames on 8/1/16.
//  Copyright © 2016 reliancegames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

@interface HomeViewController : UIViewController <CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
}

@end

